import 'package:flutter/material.dart';
import '../models/produkt.dart';
import '../services/api_service.dart';
import 'produkt_detail_screen.dart';
import 'produkt_add_edit_screen.dart';
import '../localization/app_localizations.dart';

class ProduktListScreen extends StatefulWidget {
  const ProduktListScreen({Key? key}) : super(key: key);

  @override
  _ProduktListScreenState createState() => _ProduktListScreenState();
}

class _ProduktListScreenState extends State<ProduktListScreen> {
  List<Produkt> produkty = [];
  List<Produkt> filteredProdukty = [];
  List<String> allBrands = [];
  List<String> allCategories = [];
  List<String> allCountries = [];

  bool isLoading = true;

  final ApiService apiService = ApiService();

  String? selectedBrand;
  String? selectedCategory;
  String? selectedCountry;

  @override
  void initState() {
    super.initState();
    fetchProdukty();
  }

  Future<void> fetchProdukty() async {
    try {
      final List<Produkt> fetchedProdukty = await apiService.getProdukty();
      final brands = fetchedProdukty.map((p) => p.znackaVyrobce).toSet().toList();
      final categories = fetchedProdukty.map((p) => p.kategorie).toSet().toList();
      final countries = fetchedProdukty.map((p) => p.zemePuvodu).toSet().toList();

      setState(() {
        produkty = fetchedProdukty;
        filteredProdukty = fetchedProdukty;
        allBrands = brands;
        allCategories = categories;
        allCountries = countries;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      print("Chyba při načítání produktů: $e");
    }
  }

  void filterProdukty() {
    setState(() {
      filteredProdukty = produkty.where((produkt) {
        final matchesBrand = selectedBrand == null || produkt.znackaVyrobce == selectedBrand;
        final matchesCategory = selectedCategory == null || produkt.kategorie == selectedCategory;
        final matchesCountry = selectedCountry == null || produkt.zemePuvodu == selectedCountry;
        return matchesBrand && matchesCategory && matchesCountry;
      }).toList();
    });
  }

  Future<void> deleteProdukt(int produktId) async {
    try {
      await apiService.deleteProdukt(produktId);
      await fetchProdukty();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.translate('product_deleted')),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.translate('delete_error')),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> navigateAndRefresh(Widget screen) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
    if (result != null) {
      await fetchProdukty();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('product_list')),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => FilterDialog(
                  selectedBrand: selectedBrand,
                  selectedCategory: selectedCategory,
                  selectedCountry: selectedCountry,
                  brands: allBrands,
                  categories: allCategories,
                  countries: allCountries,
                  onApply: (brand, category, country) {
                    setState(() {
                      selectedBrand = brand;
                      selectedCategory = category;
                      selectedCountry = country;
                    });
                    filterProdukty();
                    Navigator.pop(context);
                  },
                  onClear: () {
                    setState(() {
                      selectedBrand = null;
                      selectedCategory = null;
                      selectedCountry = null;
                    });
                    filterProdukty();
                    Navigator.pop(context);
                  },
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => navigateAndRefresh(
              ProduktAddEditScreen(
                onProductSaved: () => fetchProdukty(),
              ),
            ),
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : filteredProdukty.isEmpty
          ? Center(child: Text(AppLocalizations.of(context)!.translate('no_products_found')))
          : ListView.builder(
        itemCount: filteredProdukty.length,
        itemBuilder: (context, index) {
          final produkt = filteredProdukty[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: Text(
                  produkt.kodProduktu.substring(0, 1).toUpperCase(),
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              title: Text(
                produkt.kodProduktu,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${AppLocalizations.of(context)!.translate('manufacturer_brand')}: ${produkt.znackaVyrobce}',
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blueAccent),
                    onPressed: () => navigateAndRefresh(
                      ProduktAddEditScreen(
                        produkt: produkt,
                        onProductSaved: () => fetchProdukty(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(AppLocalizations.of(context)!.translate('delete_product')),
                          content: Text(AppLocalizations.of(context)!.translate('confirm_delete')),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(AppLocalizations.of(context)!.translate('cancel')),
                            ),
                            TextButton(
                              onPressed: () {
                                if (produkt.id != null) {
                                  deleteProdukt(produkt.id!);
                                } else {
                                  print("ID produktu je null");
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(AppLocalizations.of(context)!.translate('invalid_product_id')),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                                Navigator.pop(context);
                              },
                              child: const Text('Smazat'),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProduktDetailScreen(produkt: produkt),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FilterDialog extends StatefulWidget {
  final String? selectedBrand;
  final String? selectedCategory;
  final String? selectedCountry;
  final List<String> brands;
  final List<String> categories;
  final List<String> countries;
  final void Function(String?, String?, String?) onApply;
  final VoidCallback onClear;

  const FilterDialog({
    required this.selectedBrand,
    required this.selectedCategory,
    required this.selectedCountry,
    required this.brands,
    required this.categories,
    required this.countries,
    required this.onApply,
    required this.onClear,
    Key? key,
  }) : super(key: key);

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  String? selectedBrand;
  String? selectedCategory;
  String? selectedCountry;

  @override
  void initState() {
    super.initState();
    selectedBrand = widget.selectedBrand;
    selectedCategory = widget.selectedCategory;
    selectedCountry = widget.selectedCountry;
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
              items: widget.countries.map((c) {
                return DropdownMenuItem(value: c, child: Text(c));
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
          onPressed: () => widget.onApply(selectedBrand, selectedCategory, selectedCountry),
          child: Text(AppLocalizations.of(context)!.translate('apply')),
        ),
      ],
    );
  }
}
