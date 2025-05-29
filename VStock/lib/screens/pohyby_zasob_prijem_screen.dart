import 'package:flutter/material.dart';
import '../models/produkt.dart';
import '../services/api_service.dart';
import '../models/pohyb_zasob.dart';
import '../models/mena.dart';
import '../models/sklad.dart';
import 'package:intl/intl.dart';
import '../localization/app_localizations.dart';

class PohybPrijemScreen extends StatefulWidget {
  final Produkt? produkt;
  final bool jeNovyProdukt;

  const PohybPrijemScreen({
    super.key,
    required this.produkt,
    required this.jeNovyProdukt,
  });

  @override
  State<PohybPrijemScreen> createState() => _PohybPrijemScreenState();
}

class _PohybPrijemScreenState extends State<PohybPrijemScreen> {
  Mena? _vybranaMena;
  int? _cilovySkladId;
  DateTime? _selectedDate;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cenaZaKusController = TextEditingController();
  final TextEditingController _pocetKusuController = TextEditingController();
  final TextEditingController _pocetBalikuController = TextEditingController();
  final TextEditingController _datumPohybuController = TextEditingController();
  final ApiService apiService = ApiService();

  List<Mena> _menaList = [];
  List<Sklad> _skladyList = [];

  Future<void> _pickDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
        _datumPohybuController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchMeny();
    _fetchSklady();
    _selectedDate = DateTime.now();
    _datumPohybuController.text = DateFormat('dd-MM-yyyy').format(_selectedDate!);
  }

  void _fetchMeny() async {
    final response = await apiService.getMeny();
    setState(() {
      _menaList = response;
    });
  }

  void _fetchSklady() async {
    final response = await apiService.getSklady();
    setState(() {
      _skladyList = response;
    });
  }

  void _ulozitPohyb() async {
    if (_formKey.currentState!.validate() &&
        widget.produkt != null &&
        _vybranaMena != null &&
        _cilovySkladId != null) {

      final cilovySklad = _skladyList.firstWhere((s) => s.id == _cilovySkladId);

      final pohybData = PohybZasob(
        produkt: widget.produkt!.kodProduktu,
        typPohybu: 1,
        datumPohybu: DateFormat('yyyy-MM-dd').format(_selectedDate!),
        pocetKusuVBaleni: int.parse(_pocetKusuController.text),
        cenaZaKus: double.parse(_cenaZaKusController.text),
        mena: _vybranaMena!.isoKodMeny,
        pocetBalikuVPohybu: int.parse(_pocetBalikuController.text),
        cilovySklad: cilovySklad.nazev,
      );

      try {
        await apiService.createPohybZasob(pohybData);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.translate('receipt_saved')),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context, true);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${AppLocalizations.of(context)!.translate('save_error')}: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.translate('fill_all_fields')),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(AppLocalizations.of(context)!.translate('stock_receipt')),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  '${widget.produkt?.kodProduktu ?? AppLocalizations.of(context)!.translate('no_product_selected')} - ${widget.produkt?.znackaVyrobce ?? AppLocalizations.of(context)!.translate('unknown_manufacturer')}',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _cenaZaKusController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.translate('price_per_unit'),
                      ),
                      validator: (value) =>
                      value == null || value.isEmpty ? AppLocalizations.of(context)!.translate('enter_price') : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<Mena>(
                      value: _vybranaMena,
                      hint: Text(AppLocalizations.of(context)!.translate('currency')),
                      items: _menaList.map((mena) {
                        return DropdownMenuItem<Mena>(
                          value: mena,
                          child: Text('${mena.nazev} (${mena.isoKodMeny})'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _vybranaMena = value;
                        });
                      },
                      validator: (value) => value == null ? AppLocalizations.of(context)!.translate('select_currency') : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _pocetKusuController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.translate('units_per_package'),
                ),
                validator: (value) =>
                value == null || value.isEmpty ? AppLocalizations.of(context)!.translate('enter_units') : null,
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _pocetBalikuController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.translate('package_count'),
                ),
                validator: (value) =>
                value == null || value.isEmpty ? AppLocalizations.of(context)!.translate('enter_packages') : null,
              ),
              const SizedBox(height: 20),

              DropdownButtonFormField<int>(
                value: _cilovySkladId,
                hint: Text(AppLocalizations.of(context)!.translate('target_warehouse')),
                items: _skladyList.map((sklad) {
                  return DropdownMenuItem<int>(
                    value: sklad.id,
                    child: Text(sklad.nazev),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _cilovySkladId = value;
                  });
                },
                validator: (value) => value == null ? AppLocalizations.of(context)!.translate('select_warehouse') : null,
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _datumPohybuController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.translate('movement_date'),
                ),
                readOnly: true,
                onTap: _pickDate,
                validator: (value) =>
                value == null || value.isEmpty ? AppLocalizations.of(context)!.translate('enter_date') : null,
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.save),
                  label: Text(AppLocalizations.of(context)!.translate('save')),
                  onPressed: _ulozitPohyb,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.indigo,
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