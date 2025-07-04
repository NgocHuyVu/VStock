import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/pohyb_zasob.dart';
import '../models/produkt.dart';
import '../models/mena.dart';
import '../models/sklad.dart';
import '../services/api_service.dart';
import 'produkt_add_edit_screen.dart';
import 'pohyby_zasob_prijem_screen.dart';
import 'zasoby_ve_skladech_screen.dart';
import 'report_screen.dart';
import '../localization/app_localizations.dart';

class PohybyZasobScreen extends StatefulWidget {
  const PohybyZasobScreen({super.key});

  @override
  State<PohybyZasobScreen> createState() => _PohybyZasobScreenState();
}

class _PohybyZasobScreenState extends State<PohybyZasobScreen> {
  int? _typPohybu;
  int? _produktId;
  String? _produktNazev;
  String? _produktKod;
  int? _menaId;
  int? _cilovySkladId;
  int? _odchoziSkladId;
  List<PohybZasob> _pohybyZasob = [];
  bool _isLoading = false;
  bool _sortAscending = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cenaZaKusController = TextEditingController();
  final TextEditingController _pocetKusuController = TextEditingController();
  final TextEditingController _pocetBalikuController = TextEditingController();
  final TextEditingController _datumPohybuController = TextEditingController();
  final ApiService apiService = ApiService();

  List<Mena> _menaList = [];
  List<Sklad> _skladyList = [];
  List<Produkt> _produktyList = [];

  @override
  void initState() {
    super.initState();
    _loadInitialData();
    _datumPohybuController.text = DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  Future<void> _loadInitialData() async {
    setState(() => _isLoading = true);
    try {
      await Future.wait([
        _fetchMeny(),
        _fetchSklady(),
        _fetchProdukty(),
        _fetchPohybyZasob(),
      ]);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.translate('loading_data_error')),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _sortByDate(bool ascending) {
    setState(() {
      _sortAscending = ascending;
      _pohybyZasob.sort((a, b) => ascending
          ? a.datumPohybu.compareTo(b.datumPohybu)
          : b.datumPohybu.compareTo(a.datumPohybu));
    });
  }

  Future<void> _fetchPohybyZasob() async {
    final pohyby = await apiService.getPohybyZasob();
    setState(() {
      _pohybyZasob = pohyby;
      _sortByDate(_sortAscending);
    });
  }

  Future<void> _fetchProdukty() async {
    final produkty = await apiService.getProdukty();
    setState(() => _produktyList = produkty);
  }

  Future<void> _fetchMeny() async {
    final response = await apiService.getMeny();
    setState(() => _menaList = response);
  }

  Future<void> _fetchSklady() async {
    final response = await apiService.getSklady();
    setState(() => _skladyList = response);
  }

  Future<void> _pickDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      setState(() {
        _datumPohybuController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
      });
    }
  }

  String _convertToApiDateFormat(String displayDate) {
    try {
      DateTime date = DateFormat('dd-MM-yyyy').parse(displayDate);
      return DateFormat('yyyy-MM-dd').format(date);
    } catch (e) {
      return DateFormat('yyyy-MM-dd').format(DateTime.now());
    }
  }

  String _convertToDisplayFormat(String apiDate) {
    try {
      DateTime date = DateFormat('yyyy-MM-dd').parse(apiDate);
      return DateFormat('dd-MM-yyyy').format(date);
    } catch (e) {
      return apiDate;
    }
  }

  void _zvolTypPohybu(int typ) async {
    setState(() {
      _typPohybu = typ;
      _produktId = null;
      _menaId = null;
      _cilovySkladId = null;
      _odchoziSkladId = null;
    });

    if (typ == 1) {
      bool? novy = await showDialog<bool>(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(AppLocalizations.of(context)!.translate('stock_receipt')),
          content: Text(AppLocalizations.of(context)!.translate('new_product_question')),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 2,
              ),
              child: Text(AppLocalizations.of(context)!.translate('yes')),
            ),

            const SizedBox(width: 10),

            ElevatedButton(
              onPressed: () => Navigator.pop(context, false),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 2,
              ),
              child: Text(AppLocalizations.of(context)!.translate('no')),
            ),
          ],
        ),
      );

      if (novy == true) {
        final novyProdukt = await Navigator.push<Produkt>(
          context,
          MaterialPageRoute(builder: (_) => const ProduktAddEditScreen()),
        );
        if (novyProdukt != null) {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PohybPrijemScreen(
                produkt: novyProdukt,
                jeNovyProdukt: true,
              ),
            ),
          );
          await _fetchPohybyZasob();
          setState(() => _typPohybu = null);
        }
      } else {
        final produkt = await _vybratProduktDialog();
        if (produkt != null) {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PohybPrijemScreen(
                produkt: produkt,
                jeNovyProdukt: false,
              ),
            ),
          );
          await _fetchPohybyZasob();
          setState(() => _typPohybu = null);
        }
      }
    } else if (typ == 2 || typ == 3) {
      final result = await Navigator.push<Map<String, dynamic>>(
        context,
        MaterialPageRoute(
          builder: (_) => ZasobyVeSkladechScreen(
            selectMode: true,
            movementType: typ,
          ),
        ),
      );

      if (result != null) {
        setState(() {
          _produktId = result['produktId'];
          _produktNazev = result['nazevProduktu'];
          _produktKod = result['kodProduktu'];
          _pocetKusuController.text = result['pocetKusuVBaleni'].toString();
          _cenaZaKusController.text = result['cenaZaKus'].toString();
          _menaId = result['menaId'];
          _odchoziSkladId = result['odchoziSkladId'];
        });

        if (typ == 3) {
          _showMovementForm();
        }

      } else {
        setState(() => _typPohybu = null);
      }
      await _fetchPohybyZasob();
    }
  }

  void _showMovementForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    '${_produktKod ?? ''} - ${_produktNazev ?? ''}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _datumPohybuController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.translate('movement_date'),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: _pickDate,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) return AppLocalizations.of(context)!.translate('enter_date');
                      try {
                        DateFormat('dd-MM-yyyy').parseStrict(value);
                        return null;
                      } catch (e) {
                        return AppLocalizations.of(context)!.translate('invalid_date_format');
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _pocetBalikuController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.translate('packages_to_transfer'),
                    ),
                    validator: (value) => value?.isEmpty ?? true ? AppLocalizations.of(context)!.translate('enter_package_count')
                        : null,
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<int>(
                    value: _cilovySkladId,
                    hint: Text(AppLocalizations.of(context)!.translate('target_warehouse')),
                    items: _skladyList
                        .where((s) => s.id != _odchoziSkladId)
                        .map((sklad) {
                      return DropdownMenuItem<int>(
                        value: sklad.id,
                        child: Text(sklad.nazev),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() => _cilovySkladId = value);
                    },
                    validator: (value) => value == null
                        ? AppLocalizations.of(context)!.translate('select_target_warehouse')
                        : null,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _ulozitPohyb,
                    child: Text(AppLocalizations.of(context)!.translate('save_transfer')),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<Produkt?> _vybratProduktDialog() async {
    final produktyList = await apiService.getProdukty();
    return showDialog<Produkt>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.translate('select_product')),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: produktyList.length,
            itemBuilder: (_, index) {
              final p = produktyList[index];
              return ListTile(
                title: Text('${p.kodProduktu} - ${p.znackaVyrobce}'),
                onTap: () => Navigator.pop(context, p),
              );
            },
          ),
        ),
      ),
    );
  }

  void _ulozitPohyb() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (_produktId == null || _menaId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.translate('missing_data')),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      if (_typPohybu == 3 && (_odchoziSkladId == null || _cilovySkladId == null)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.translate('both_warehouses_required')),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      final produkt = _produktyList.firstWhere((p) => p.id == _produktId);
      final mena = _menaList.firstWhere((m) => m.id == _menaId);
      final odchoziSklad = _odchoziSkladId != null
          ? _skladyList.firstWhere((s) => s.id == _odchoziSkladId).nazev
          : null;
      final cilovySklad = _cilovySkladId != null
          ? _skladyList.firstWhere((s) => s.id == _cilovySkladId).nazev
          : null;


      final pohybData = PohybZasob(
        produkt: produkt.kodProduktu,
        typPohybu: _typPohybu!,
        datumPohybu: _convertToApiDateFormat(_datumPohybuController.text),
        pocetKusuVBaleni: int.parse(_pocetKusuController.text),
        cenaZaKus: double.parse(_cenaZaKusController.text),
        mena: mena.isoKodMeny,
        pocetBalikuVPohybu: int.parse(_pocetBalikuController.text),
        odchoziSklad: odchoziSklad,
        cilovySklad: cilovySklad,
      );
      debugPrint('Sending data: ${pohybData.toJson()}');
      try {
        setState(() => _isLoading = true);
        await apiService.createPohybZasob(pohybData);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.translate('movement_saved')),
            backgroundColor: Colors.red,
          ),
        );
        _resetForm();
        await _fetchPohybyZasob();
        if (mounted) Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.translate('save_error')),
            backgroundColor: Colors.red,
          ),
        );
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  void _resetForm() {
    setState(() {
      _typPohybu = null;
      _produktId = null;
      _produktNazev = null;
      _produktKod = null;
      _menaId = null;
      _cilovySkladId = null;
      _odchoziSkladId = null;
    });
    _formKey.currentState?.reset();
    _cenaZaKusController.clear();
    _pocetKusuController.clear();
    _pocetBalikuController.clear();
    _datumPohybuController.text = DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(AppLocalizations.of(context)!.translate('stock_movements'),
            style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.analytics), // Report icon
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ReportScreen()),
              );
            },
            tooltip: AppLocalizations.of(context)!.translate('reports'),
          ),
          IconButton(
            icon: Icon(_sortAscending ? Icons.arrow_downward : Icons.arrow_upward),
            onPressed: () {
              _sortByDate(!_sortAscending);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    _sortAscending
                        ? AppLocalizations.of(context)!.translate('sort_oldest')
                        : AppLocalizations.of(context)!.translate('sort_newest'),
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.green,
                ),
              );
            },
            tooltip: AppLocalizations.of(context)!.translate('sort_by_date'),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.download, size: 24),
                  label: Text(AppLocalizations.of(context)!.translate('receipt'),
                      style: TextStyle(fontSize: 14)),
                  onPressed: () => _zvolTypPohybu(1),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  ),
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.swap_horiz, size: 24),
                  label: Text(AppLocalizations.of(context)!.translate('transfer'), style: TextStyle(fontSize: 14)),
                  onPressed: () => _zvolTypPohybu(3),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  ),
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.upload, size: 24),
                  label: Text(AppLocalizations.of(context)!.translate('issue'), style: TextStyle(fontSize: 14)),
                  onPressed: () => _zvolTypPohybu(2),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _pohybyZasob.isEmpty
                ? Center(child: Text(AppLocalizations.of(context)!.translate('no_movements')))
                : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columnSpacing: 20,
                  sortColumnIndex: 0,
                  sortAscending: _sortAscending,
                  columns: [
                    DataColumn(label: Text(AppLocalizations.of(context)!.translate('date'),
                        style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text(AppLocalizations.of(context)!.translate('movement_type'),
                        style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text(AppLocalizations.of(context)!.translate('product_code'),
                        style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text(AppLocalizations.of(context)!.translate('units_per_package'),
                        style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text(AppLocalizations.of(context)!.translate('price_per_unit'),
                        style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text(AppLocalizations.of(context)!.translate('currency'),
                        style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text(AppLocalizations.of(context)!.translate('package_count'),
                        style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text(AppLocalizations.of(context)!.translate('from_warehouse'),
                        style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text(AppLocalizations.of(context)!.translate('to_warehouse'),
                        style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  rows: _pohybyZasob.map((pohyb) {
                    return DataRow(cells: [
                      DataCell(Text(_convertToDisplayFormat(pohyb.datumPohybu))),
                      DataCell(Text(
                          pohyb.typPohybu == 1
                              ? AppLocalizations.of(context)!.translate('receipt')
                              : pohyb.typPohybu == 2
                              ? AppLocalizations.of(context)!.translate('issue')
                              : AppLocalizations.of(context)!.translate('transfer'))),
                      DataCell(Text(pohyb.produkt)),
                      DataCell(Text(pohyb.pocetKusuVBaleni.toString())),
                      DataCell(Text(pohyb.cenaZaKus.toStringAsFixed(2))),
                      DataCell(Text(pohyb.mena)),
                      DataCell(Text(pohyb.pocetBalikuVPohybu.toString())),
                      DataCell(Text(pohyb.odchoziSklad ?? '-')),
                      DataCell(Text(pohyb.cilovySklad ?? '-')),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}