import 'package:flutter/material.dart';
import '../models/sklad.dart';
import '../services/api_service.dart';
import '../localization/app_localizations.dart';

class SkladAddEditScreen extends StatefulWidget {
  final Sklad? sklad;

  const SkladAddEditScreen({super.key, this.sklad});

  @override
  State<SkladAddEditScreen> createState() => _SkladAddEditScreenState();
}

class _SkladAddEditScreenState extends State<SkladAddEditScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _nazev;
  final ApiService _apiService = ApiService();
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _nazev = widget.sklad?.nazev ?? '';
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);
    _formKey.currentState!.save();

    try {
      final sklad = Sklad(
        id: widget.sklad?.id,
        nazev: _nazev,
      );

      if (widget.sklad == null) {
        await _apiService.createSklad(sklad);
      } else {
        await _apiService.updateSklad(sklad);
      }

      Navigator.pop(context, true);
    } catch (e) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(AppLocalizations.of(context)!.translate('error')),
          content: Text(AppLocalizations.of(context)!.translate('warehouse_save_error')),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(AppLocalizations.of(context)!.translate('ok')),
            ),
          ],
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditMode = widget.sklad != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditMode
              ? AppLocalizations.of(context)!.translate('edit_warehouse')
              : AppLocalizations.of(context)!.translate('add_warehouse'),
        ),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _nazev,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.translate('warehouse_name'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.translate('warehouse_name_required');
                  }
                  return null;
                },
                onSaved: (value) => _nazev = value!,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
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
                        ? AppLocalizations.of(context)!.translate('update')
                        : AppLocalizations.of(context)!.translate('add'),
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