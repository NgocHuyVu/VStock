import 'package:flutter/material.dart';
import '../models/sklad.dart';
import 'sklad_add_edit_screen.dart';
import '../services/api_service.dart';
import '../localization/app_localizations.dart';

class SkladListScreen extends StatefulWidget {
  const SkladListScreen({super.key});

  @override
  State<SkladListScreen> createState() => _SkladListScreenState();
}

class _SkladListScreenState extends State<SkladListScreen> {
  List<Sklad> _sklady = [];
  bool _isLoading = true;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    fetchSklady();
  }

  Future<void> fetchSklady() async {
    setState(() => _isLoading = true);

    try {
      final response = await _apiService.getSklady();
      setState(() {
        _sklady = response;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      debugPrint('${AppLocalizations.of(context)!.translate('loading_error')}: $e');
    }
  }

  Future<void> _confirmAndDeleteSklad(int? id) async {
    if (id == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.translate('invalid_id_error')),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.translate('confirmation')),
        content: Text(AppLocalizations.of(context)!.translate('delete_warehouse_confirm')),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(AppLocalizations.of(context)!.translate('cancel')),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              AppLocalizations.of(context)!.translate('delete'),
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await _apiService.deleteSklady(id);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.translate('warehouse_deleted')),
            backgroundColor: Colors.green,
          ),
        );
        fetchSklady();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${AppLocalizations.of(context)!.translate('delete_error')}: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _navigateToAddEditScreen(Sklad? sklad) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SkladAddEditScreen(sklad: sklad),
      ),
    );

    if (result != null) {
      fetchSklady();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('warehouse_list')),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _navigateToAddEditScreen(null),
          ),
        ],
      ),
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
        ),
      )
          : _sklady.isEmpty
          ? Center(child: Text(AppLocalizations.of(context)!.translate('no_warehouses')))
          : RefreshIndicator(
        onRefresh: fetchSklady,
        color: Colors.teal,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          itemCount: _sklady.length,
          itemBuilder: (context, index) {
            final sklad = _sklady[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Text(
                    sklad.nazev.substring(0, 1).toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  sklad.nazev,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                /*
                subtitle: Text(
                  'ID: ${sklad.id}',
                  style: const TextStyle(fontSize: 14),
                ),
                 */
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.teal),
                      onPressed: () => _navigateToAddEditScreen(sklad),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _confirmAndDeleteSklad(sklad.id),
                    ),
                  ],
                ),
                onTap: () => _navigateToAddEditScreen(sklad),
              ),
            );
          },
        ),
      ),
    );
  }
}