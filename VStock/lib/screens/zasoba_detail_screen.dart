import 'package:flutter/material.dart';
import '../models/zasoba.dart';
import '../localization/app_localizations.dart';

class ZasobaDetailScreen extends StatelessWidget {
  final List<Zasoba> zasoby;

  const ZasobaDetailScreen({Key? key, required this.zasoby}) : super(key: key);

  Widget _buildDetailItem(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
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
    if (zasoby.isEmpty) {
      return Scaffold(
        body: Center(child: Text(AppLocalizations.of(context)!.translate('no_stock_to_display'))),
      );
    }

    final produkt = zasoby.first;

    final Map<String, List<Zasoba>> groupedBySklad = {};
    for (var z in zasoby) {
      groupedBySklad.putIfAbsent(z.sklad, () => []).add(z);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${produkt.kodProduktu}'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailItem(
                Icons.label,
                '${AppLocalizations.of(context)!.translate('product_name')}:',
                produkt.nazevProduktu,
              ),
              _buildDetailItem(
                Icons.category,
                '${AppLocalizations.of(context)!.translate('category')}:',
                produkt.kategorie,
              ),
              _buildDetailItem(
                Icons.branding_watermark,
                '${AppLocalizations.of(context)!.translate('manufacturer_brand')}:',
                produkt.znackaVyrobce,
              ),
              _buildDetailItem(
                Icons.public,
                '${AppLocalizations.of(context)!.translate('country_of_origin')}:',
                produkt.zemePuvodu,
              ),
              const Divider(height: 30, thickness: 2),

              for (var sklad in groupedBySklad.keys) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    sklad,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),

                for (var zasoba in groupedBySklad[sklad]!) ...[
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          _buildDetailItem(
                            Icons.move_to_inbox,
                            '${AppLocalizations.of(context)!.translate('piece_count')}:',
                            zasoba.pocetKusu.toString(),
                          ),
                          _buildDetailItem(
                            Icons.attach_money,
                            '${AppLocalizations.of(context)!.translate('price_per_unit')}:',
                            zasoba.cenaZaKus.toString(),
                          ),
                          _buildDetailItem(
                            Icons.currency_exchange,
                            '${AppLocalizations.of(context)!.translate('currency')}:',
                            zasoba.mena,
                          ),
                          _buildDetailItem(
                            Icons.inventory,
                            '${AppLocalizations.of(context)!.translate('package_count')}:',
                            zasoba.pocetBaliku.toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}
