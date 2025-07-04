import 'package:flutter/material.dart';
import '../localization/app_localizations.dart';
import '../models/produkt.dart';
import '../models/zasoba.dart';
import '../services/api_service.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final ApiService _apiService = ApiService();
  bool _isLoading = true;
  List<Zasoba> _inventory = [];
  List<Produkt> _products = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final inventory = await _apiService.getZasoby();
      final products = await _apiService.getProdukty();

      setState(() {
        _inventory = inventory;
        _products = products;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.translate('loading_data_error')),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Map<String, int> _getInventoryByProduct() {
    final productMap = <String, int>{};

    for (final item in _inventory) {
      productMap.update(
        item.kodProduktu,
            (value) => value + item.pocetBaliku,
        ifAbsent: () => item.pocetBaliku,
      );
    }

    return productMap;
  }

  int _getTotalInventory() {
    final productMap = _getInventoryByProduct();
    return productMap.values.fold(0, (sum, count) => sum + count);
  }

  Map<String, int> _getInventoryByManufacturer() {
    final manufacturerMap = <String, int>{};
    final productMap = _getInventoryByProduct();

    for (final entry in productMap.entries) {
      try {
        final product = _products.firstWhere((p) => p.kodProduktu == entry.key);
        manufacturerMap.update(
          product.znackaVyrobce,
              (value) => value + entry.value,
          ifAbsent: () => entry.value,
        );
      } catch (e) {
        // Skip if product not found
      }
    }

    return manufacturerMap;
  }

  List<MapEntry<String, int>> _getHighestInventory() {
    final productMap = _getInventoryByProduct();
    final sortedEntries = productMap.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return sortedEntries.take(3).toList();
  }

  List<MapEntry<String, int>> _getLowestInventory() {
    final productMap = _getInventoryByProduct();
    final sortedEntries = productMap.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));
    return sortedEntries.where((item) => item.value <= 2).take(3).toList();
  }

  String _getPackageText(int count) {
    if (count == 0) {
      return AppLocalizations.of(context)!.translate('package_zero');
    } else if (count == 1) {
      return AppLocalizations.of(context)!.translate('package_one');
    } else if (count >= 2 && count <= 4) {
      return AppLocalizations.of(context)!.translate('packages_few');
    } else {
      return AppLocalizations.of(context)!.translate('packages_many');
    }
  }

  Widget _buildInventoryCard(String title, Widget content) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildManufacturerInventory() {
    final manufacturerMap = _getInventoryByManufacturer();

    return Column(
      children: manufacturerMap.entries.map((entry) {
        final packageText = _getPackageText(entry.value);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  entry.key,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text('${entry.value} $packageText'),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildHighestInventory() {
    final highestItems = _getHighestInventory();

    return Column(
      children: highestItems.map((entry) {
        final product = _products.firstWhere((p) => p.kodProduktu == entry.key);
        final packageText = _getPackageText(entry.value);
        return ListTile(
          title: Text('${product.kodProduktu}'),
          trailing: Text('${entry.value} $packageText'),
        );
      }).toList(),
    );
  }

  Widget _buildLowestInventory() {
    final lowestItems = _getLowestInventory();

    return Column(
      children: lowestItems.map((entry) {
        final product = _products.firstWhere((p) => p.kodProduktu == entry.key);
        final packageText = _getPackageText(entry.value);
        return ListTile(
          leading: const Icon(Icons.warning, color: Colors.orange),
          title: Text('${product.kodProduktu}'),
          trailing: Text('${entry.value} $packageText'),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalInventory = _getTotalInventory();
    final packageText = _getPackageText(totalInventory);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          AppLocalizations.of(context)!.translate('inventory_report'),
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _loadData,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildInventoryCard(
              AppLocalizations.of(context)!.translate('total_inventory'),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$totalInventory',
                      style: const TextStyle(
                          fontSize: 34
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      packageText,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            _buildInventoryCard(
              AppLocalizations.of(context)!.translate('inventory_by_manufacturer'),
              _buildManufacturerInventory(),
            ),

            _buildInventoryCard(
              AppLocalizations.of(context)!.translate('top_products'),
              _buildHighestInventory(),
            ),

            _buildInventoryCard(
              AppLocalizations.of(context)!.translate('low_stock_products'),
              _buildLowestInventory(),
            ),
          ],
        ),
      ),
    );
  }
}