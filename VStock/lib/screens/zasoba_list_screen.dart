import 'package:flutter/material.dart';
import '../models/zasoba.dart';
import '../services/api_service.dart';
import 'zasoba_detail_screen.dart';
import '../localization/app_localizations.dart';


class ZasobaListScreen extends StatefulWidget {
  const ZasobaListScreen({Key? key}) : super(key: key);

  @override
  _ZasobaListScreenState createState() => _ZasobaListScreenState();
}

class _ZasobaListScreenState extends State<ZasobaListScreen> {
  List<Zasoba> allZasoby = [];
  List<Zasoba> filteredZasoby = [];
  bool isLoading = true;

  String? selectedCategory;
  String? selectedBrand;
  String? selectedCountry;
  String? selectedWarehouse;

  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    fetchZasoby();
  }

  Future<void> fetchZasoby() async {
    try {
      final List<Zasoba> fetchedZasoby = await apiService.getZasoby();
      setState(() {
        allZasoby = fetchedZasoby;
        filteredZasoby = fetchedZasoby;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      print("Chyba při načítání zásob: $e");
    }
  }

  void filterZasoby() {
    setState(() {
      filteredZasoby = allZasoby.where((zasoba) {
        final matchCategory = selectedCategory == null || zasoba.kategorie == selectedCategory;
        final matchBrand = selectedBrand == null || zasoba.znackaVyrobce == selectedBrand;
        final matchCountry = selectedCountry == null || zasoba.zemePuvodu == selectedCountry;
        final matchWarehouse = selectedWarehouse == null || zasoba.sklad == selectedWarehouse;
        return matchCategory && matchBrand && matchCountry && matchWarehouse;
      }).toList();
    });
  }

  void openFilterDialog() {
    final categories = allZasoby.map((z) => z.kategorie).toSet().toList();
    final brands = allZasoby.map((z) => z.znackaVyrobce).toSet().toList();
    final countries = allZasoby.map((z) => z.zemePuvodu).toSet().toList();
    final warehouses = allZasoby.map((z) => z.sklad).toSet().toList();

    showDialog(
      context: context,
      builder: (context) {
        return FilterDialog(
          selectedCategory: selectedCategory,
          selectedBrand: selectedBrand,
          selectedCountry: selectedCountry,
          selectedWarehouse: selectedWarehouse,
          categories: categories,
          brands: brands,
          countries: countries,
          warehouses: warehouses,
          onApply: (category, brand, country, warehouse) {
            setState(() {
              selectedCategory = category;
              selectedBrand = brand;
              selectedCountry = country;
              selectedWarehouse = warehouse;
            });
            filterZasoby();
            Navigator.pop(context);
          },
          onClear: () {
            setState(() {
              selectedCategory = null;
              selectedBrand = null;
              selectedCountry = null;
              selectedWarehouse = null;
            });
            filterZasoby();
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final groupedZasoby = <String, List<Zasoba>>{};

    for (var zasoba in filteredZasoby) {
      groupedZasoby.putIfAbsent(zasoba.kodProduktu, () => []).add(zasoba);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('stock_list')),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined),
            onPressed: openFilterDialog,
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : groupedZasoby.isEmpty
          ? Center(child: Text(AppLocalizations.of(context)!.translate('no_stock_found')))
          : ListView(
        children: groupedZasoby.entries.map((entry) {
          final kodProduktu = entry.key;
          final zasobyList = entry.value;
          final totalBaliku = zasobyList.fold<int>(
            0,
                (sum, z) => sum + z.pocetBaliku,
          );

          return Card(
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: Text(
                  kodProduktu.substring(0, 1).toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              title: Text(
                kodProduktu,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "${AppLocalizations.of(context)!.translate('total_packages')}: $totalBaliku\n"
                    "${AppLocalizations.of(context)!.translate('manufacturer_brand')}: ${zasobyList.first.znackaVyrobce}",
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ZasobaDetailScreen(
                      zasoby: zasobyList,
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

class FilterDialog extends StatefulWidget {
  final String? selectedCategory;
  final String? selectedBrand;
  final String? selectedCountry;
  final String? selectedWarehouse;
  final List<String> categories;
  final List<String> brands;
  final List<String> countries;
  final List<String> warehouses;
  final void Function(String?, String?, String?, String?) onApply;
  final VoidCallback onClear;

  const FilterDialog({
    required this.selectedCategory,
    required this.selectedBrand,
    required this.selectedCountry,
    required this.selectedWarehouse,
    required this.categories,
    required this.brands,
    required this.countries,
    required this.warehouses,
    required this.onApply,
    required this.onClear,
    Key? key,
  }) : super(key: key);

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  String? selectedCategory;
  String? selectedBrand;
  String? selectedCountry;
  String? selectedWarehouse;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.selectedCategory;
    selectedBrand = widget.selectedBrand;
    selectedCountry = widget.selectedCountry;
    selectedWarehouse = widget.selectedWarehouse;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.translate('filter')),
      content: SingleChildScrollView(
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedBrand,
              hint: Text(AppLocalizations.of(context)!.translate('manufacturer_brand')),
              isExpanded: true,
              onChanged: (value) => setState(() => selectedBrand = value),
              items: widget.brands.map((brand) {
                return DropdownMenuItem(value: brand, child: Text(brand));
              }).toList(),
            ),
            DropdownButton<String>(
              value: selectedCategory,
              hint: Text(AppLocalizations.of(context)!.translate('category')),
              isExpanded: true,
              onChanged: (value) => setState(() => selectedCategory = value),
              items: widget.categories.map((cat) {
                return DropdownMenuItem(value: cat, child: Text(cat));
              }).toList(),
            ),
            DropdownButton<String>(
              value: selectedCountry,
              hint: Text(AppLocalizations.of(context)!.translate('country_of_origin')),
              isExpanded: true,
              onChanged: (value) => setState(() => selectedCountry = value),
              items: widget.countries.map((country) {
                return DropdownMenuItem(value: country, child: Text(country));
              }).toList(),
            ),
            DropdownButton<String>(
              value: selectedWarehouse,
              hint: Text(AppLocalizations.of(context)!.translate('warehouse')),
              isExpanded: true,
              onChanged: (value) => setState(() => selectedWarehouse = value),
              items: widget.warehouses.map((warehouse) {
                return DropdownMenuItem(value: warehouse, child: Text(warehouse));
              }).toList(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: widget.onClear,
          child: Text(AppLocalizations.of(context)!.translate('clear_filter')),
        ),
        TextButton(
          onPressed: () => widget.onApply(
            selectedCategory,
            selectedBrand,
            selectedCountry,
            selectedWarehouse,
          ),
          child: Text(AppLocalizations.of(context)!.translate('apply')),
        ),
      ],
    );
  }
}
