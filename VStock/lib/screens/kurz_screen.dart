import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/api_service.dart';
import '../models/kurz.dart';
import '../localization/app_localizations.dart';

class KurzScreen extends StatefulWidget {
  const KurzScreen({Key? key}) : super(key: key);

  @override
  _KurzScreenState createState() => _KurzScreenState();
}

class _KurzScreenState extends State<KurzScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<Kurz>> _futureKurzy;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    setState(() {
      _futureKurzy = _apiService.getKurzyMeny();
    });
  }

  List<Kurz> _sortKurzy(List<Kurz> kurzy) {
    kurzy.sort((a, b) => b.datumKurzu.compareTo(a.datumKurzu));
    return kurzy;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.translate('exchange_rates'),
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.amber,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 4,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadData,
          ),
        ],
      ),
      body: FutureBuilder(
        future: _futureKurzy,
        builder: (context, AsyncSnapshot<List<Kurz>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
              ),
            );
          }
          if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.error.toString());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return _buildEmptyWidget();
          }

          final kurzy = _sortKurzy(snapshot.data!);

          return _buildKurzyList(kurzy);
        },
      ),
    );
  }
  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 50),
          const SizedBox(height: 16),
          Text(
            '${AppLocalizations.of(context)!.translate('error')}: $error',
            style: const TextStyle(fontSize: 16, color: Colors.red),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _loadData,
            child: Text(AppLocalizations.of(context)!.translate('retry')),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildEmptyWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.info_outline,
            color: Colors.amber,
            size: 50,
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.translate('no_rates_available'),
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _loadData,
            child: Text(AppLocalizations.of(context)!.translate('refresh')),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildKurzyList(List<Kurz> kurzy) {
    final dateFormat = DateFormat('dd/MM/yyyy', AppLocalizations.of(context)!.locale.toString());

    return RefreshIndicator(
      onRefresh: () async => _loadData(),
      color: Colors.amber,
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: kurzy.length,
        itemBuilder: (context, index) {
          final kurz = kurzy[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.currency_exchange, color: Colors.amber),
              ),
              title: Text(
                '${kurz.menaZ} → ${kurz.menaDo}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    dateFormat.format(kurz.datumKurzu),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    kurz.kurz.toStringAsFixed(4),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}