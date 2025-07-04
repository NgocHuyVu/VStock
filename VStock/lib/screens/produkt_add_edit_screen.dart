import 'package:flutter/material.dart';
import '../models/produkt.dart';
import '../services/api_service.dart';
import '../localization/app_localizations.dart';

class ProduktAddEditScreen extends StatefulWidget {
  final Produkt? produkt;
  final bool returnProductOnSave;
  final VoidCallback? onProductSaved;

  const ProduktAddEditScreen({
    Key? key,
    this.produkt,
    this.returnProductOnSave = false,
    this.onProductSaved,
  }) : super(key: key);

  @override
  _ProduktAddEditScreenState createState() => _ProduktAddEditScreenState();
}

class _ProduktAddEditScreenState extends State<ProduktAddEditScreen> {
  final ApiService apiService = ApiService();
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nazevController;
  late TextEditingController _kodProduktuController;
  late TextEditingController _kategorieController;
  late TextEditingController _znackaVyrobceController;
  late TextEditingController _zemePuvoduController;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _nazevController = TextEditingController(text: widget.produkt?.nazev ?? '');
    _kodProduktuController = TextEditingController(text: widget.produkt?.kodProduktu ?? '');
    _kategorieController = TextEditingController(text: widget.produkt?.kategorie ?? '');
    _znackaVyrobceController = TextEditingController(text: widget.produkt?.znackaVyrobce ?? '');
    _zemePuvoduController = TextEditingController(text: widget.produkt?.zemePuvodu ?? '');
  }

  @override
  void dispose() {
    _nazevController.dispose();
    _kodProduktuController.dispose();
    _kategorieController.dispose();
    _znackaVyrobceController.dispose();
    _zemePuvoduController.dispose();
    super.dispose();
  }

  Future<void> _saveProduct() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _isSubmitting = true);

    try {
      final product = Produkt(
        id: widget.produkt?.id,
        nazev: _nazevController.text,
        kodProduktu: _kodProduktuController.text,
        kategorie: _kategorieController.text,
        znackaVyrobce: _znackaVyrobceController.text,
        zemePuvodu: _zemePuvoduController.text,
      );

      if (widget.produkt == null) {
        await apiService.createProdukt(product);
      } else if (product.id != null) {
        await apiService.updateProdukt(product);
      } else {
        throw Exception(AppLocalizations.of(context)!.translate('missing_product_id'));
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(widget.produkt == null
              ? AppLocalizations.of(context)!.translate('product_added')
              : AppLocalizations.of(context)!.translate('product_updated')),
          backgroundColor: Colors.green,
        ),
      );

      widget.onProductSaved?.call();
      if (mounted) Navigator.pop(context, true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${AppLocalizations.of(context)!.translate('error')}: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
      debugPrint('Error saving product: $e');
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditMode = widget.produkt != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMode
            ? AppLocalizations.of(context)!.translate('edit_product')
            : AppLocalizations.of(context)!.translate('add_product')),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nazevController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.translate('product_name'),
                ),
                validator: (value) => value?.isEmpty ?? true
                    ? AppLocalizations.of(context)!.translate('product_name_required')
                    : null,
              ),
              TextFormField(
                controller: _kodProduktuController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.translate('product_code'),
                ),
                validator: (value) => value?.isEmpty ?? true
                    ? AppLocalizations.of(context)!.translate('product_code_required')
                    : null,
              ),
              TextFormField(
                controller: _kategorieController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.translate('category'),
                ),
              ),
              TextFormField(
                controller: _znackaVyrobceController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.translate('manufacturer_brand'),
                ),
              ),
              TextFormField(
                controller: _zemePuvoduController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.translate('country_of_origin'),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _saveProduct,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: _isSubmitting
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                    isEditMode
                        ? AppLocalizations.of(context)!.translate('save_changes')
                        : AppLocalizations.of(context)!.translate('add_product'),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}