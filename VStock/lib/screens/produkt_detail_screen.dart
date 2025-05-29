import 'package:flutter/material.dart';
import '../models/produkt.dart';
import '../localization/app_localizations.dart';

class ProduktDetailScreen extends StatelessWidget {
  final Produkt produkt;

  const ProduktDetailScreen({Key? key, required this.produkt}) : super(key: key);

  Widget _buildDetailItem(BuildContext context, IconData icon, String titleKey, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.translate(titleKey),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value.isNotEmpty ? value : AppLocalizations.of(context)!.translate('empty_product_data'),
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('product_detail')),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          tooltip: AppLocalizations.of(context)!.translate('back_to_list'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            shadowColor: Colors.blueAccent.withOpacity(0.3),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      produkt.nazev.isNotEmpty
                          ? produkt.nazev
                          : AppLocalizations.of(context)!.translate('product_name'),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  const Divider(height: 30, thickness: 1.5),
                  _buildDetailItem(context, Icons.code, 'product_code', produkt.kodProduktu),
                  _buildDetailItem(context, Icons.category, 'category', produkt.kategorie),
                  _buildDetailItem(context, Icons.branding_watermark, 'manufacturer_brand', produkt.znackaVyrobce),
                  _buildDetailItem(context, Icons.public, 'country_of_origin', produkt.zemePuvodu),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}