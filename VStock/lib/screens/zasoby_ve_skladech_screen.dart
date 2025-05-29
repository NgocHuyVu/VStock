import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/zasoba.dart';
import '../models/mena.dart';
import '../models/sklad.dart';
import '../models/pohyb_zasob.dart';
import '../services/api_service.dart';
import '../localization/app_localizations.dart';

class ZasobyVeSkladechScreen extends StatefulWidget {
  final bool selectMode;
  final int movementType; // 2 = výdej, 3 = přesun

  const ZasobyVeSkladechScreen({
    Key? key,
    required this.selectMode,
    required this.movementType,
  }) : super(key: key);

  @override
  _ZasobyVeSkladechScreenState createState() => _ZasobyVeSkladechScreenState();
}

class _ZasobyVeSkladechScreenState extends State<ZasobyVeSkladechScreen> {
  List<Zasoba> allZasoby = [];
  List<Mena> menaList = [];
  List<Sklad> skladyList = [];
  bool isLoading = true;
  final TextEditingController _pocetBalikuController = TextEditingController();
  final TextEditingController _datumPohybuController = TextEditingController();
  int? _cilovySkladId;

  @override
  void initState() {
    super.initState();
    _fetchData();
    _datumPohybuController.text = DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  String _convertToApiDateFormat(String displayDate) {
    try {
      DateTime date = DateFormat('dd-MM-yyyy').parse(displayDate);
      return DateFormat('yyyy-MM-dd').format(date);
    } catch (e) {
      return DateFormat('yyyy-MM-dd').format(DateTime.now());
    }
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

  Future<void> _fetchData() async {
    try {
      final zasoby = await ApiService().getZasoby();
      final meny = await ApiService().getMeny();
      final sklady = await ApiService().getSklady();

      setState(() {
        allZasoby = zasoby;
        menaList = meny;
        skladyList = sklady;
        isLoading = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Chyba při načítání dat: ${e.toString()}'),
          backgroundColor: Colors.red,
          action: SnackBarAction(
            label: 'Znovu',
            textColor: Colors.white,
            onPressed: _fetchData,
          ),
        ),
      );

      setState(() => isLoading = false);
    }
  }

  int? _findMenaId(String menaIdentifier) {
    try {
      return menaList.firstWhere(
              (m) => m.isoKodMeny.trim().toLowerCase() == menaIdentifier.trim().toLowerCase(),
          orElse: () => menaList.firstWhere(
                  (m) => m.nazev.trim().toLowerCase() == menaIdentifier.trim().toLowerCase()
          )
      ).id;
    } catch (e) {
      debugPrint('Nepodařilo se najít měnu "$menaIdentifier": $e');
      return null;
    }
  }

  int? _findSkladId(String skladName) {
    try {
      return skladyList.firstWhere(
              (s) => s.nazev.trim().toLowerCase() == skladName.trim().toLowerCase()
      ).id;
    } catch (e) {
      debugPrint('${AppLocalizations.of(context)!.translate('failed_to_find_warehouse')} "$skladName": $e');
      return null;
    }
  }

  void _showMovementForm(Zasoba chosen, int typPohybu) {
    final currentStock = allZasoby
        .where((z) => z.kodProduktu == chosen.kodProduktu &&
        z.pocetKusu == chosen.pocetKusu &&
        z.cenaZaKus == chosen.cenaZaKus &&
        z.mena == chosen.mena &&
        z.sklad == chosen.sklad)
        .fold<int>(0, (sum, item) => sum + item.pocetBaliku);

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
            child: Column(
              children: [
                Text(
                  '${chosen.kodProduktu} - ${chosen.nazevProduktu}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${AppLocalizations.of(context)!.translate('available_quantity')}: $currentStock ${AppLocalizations.of(context)!.translate('packages')}',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                if (typPohybu == 3) ...[
                  DropdownButtonFormField<int>(
                    value: null,
                    hint: Text(AppLocalizations.of(context)!.translate('target_warehouse')),
                    items: skladyList
                        .where((s) => s.id != _findSkladId(chosen.sklad))
                        .map((sklad) {
                      return DropdownMenuItem<int>(
                        value: sklad.id,
                        child: Text(sklad.nazev),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() => _cilovySkladId = value);
                    },
                    validator: (value) => value == null ? AppLocalizations.of(context)!.translate('select_warehouse') : null,
                  ),
                  const SizedBox(height: 16),
                ],
                TextFormField(
                  controller: _pocetBalikuController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: widget.movementType == 2
                        ? AppLocalizations.of(context)!.translate('packages_to_issue')
                        : AppLocalizations.of(context)!.translate('packages_to_move'),
                    hintText: '${AppLocalizations.of(context)!.translate('maximum')}: $currentStock ${AppLocalizations.of(context)!.translate('packages')}',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) return AppLocalizations.of(context)!.translate('enter_package_count');
                    final enteredValue = int.tryParse(value!) ?? 0;
                    if (enteredValue <= 0) return AppLocalizations.of(context)!.translate('enter_positive_number');
                    if (enteredValue > currentStock) return AppLocalizations.of(context)!.translate('exceeds_available');
                    return null;
                  },
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
                  readOnly: true,
                  onTap: _pickDate,
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
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    if (_pocetBalikuController.text.isEmpty ||
                        (typPohybu == 3 && _cilovySkladId == null)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppLocalizations.of(context)!.translate('fill_all_fields')),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    try {
                      DateFormat('dd-MM-yyyy').parseStrict(_datumPohybuController.text);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppLocalizations.of(context)!.translate('invalid_date_format')),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    final enteredQuantity = int.tryParse(_pocetBalikuController.text) ?? 0;

                    if (enteredQuantity <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppLocalizations.of(context)!.translate('enter_positive_number')),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    if (enteredQuantity > currentStock) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${AppLocalizations.of(context)!.translate('exceeds_available')} ($currentStock)',
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    try {
                      final mena = menaList.firstWhere((m) => m.id == _findMenaId(chosen.mena));
                      final odchoziSklad = skladyList.firstWhere((s) => s.id == _findSkladId(chosen.sklad));
                      final cilovySklad = _cilovySkladId != null
                          ? skladyList.firstWhere((s) => s.id == _cilovySkladId)
                          : null;

                      final pohyb = PohybZasob(
                        produkt: chosen.kodProduktu,
                        typPohybu: typPohybu,
                        datumPohybu: _convertToApiDateFormat(_datumPohybuController.text),
                        pocetKusuVBaleni: chosen.pocetKusu,
                        cenaZaKus: chosen.cenaZaKus,
                        mena: mena.isoKodMeny,
                        pocetBalikuVPohybu: enteredQuantity,
                        odchoziSklad: odchoziSklad.nazev,
                        cilovySklad: cilovySklad?.nazev,
                      );

                      await ApiService().createPohybZasob(pohyb);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppLocalizations.of(context)!.translate('successfully_saved')),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pop(context);
                      Navigator.pop(context);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${AppLocalizations.of(context)!.translate('save_error')}: ${e.toString()}'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.indigo,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 2,
                  ),
                  child: Text(AppLocalizations.of(context)!.translate('save')),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final grouped = <String, List<Zasoba>>{};
    for (var z in allZasoby) {
      grouped.putIfAbsent(z.kodProduktu, () => []).add(z);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('stock_in_warehouses')),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: grouped.entries.map((entry) {
          final code = entry.key;
          final variantsList = entry.value;
          final totalPackages = variantsList.fold<int>(0, (sum, item) => sum + item.pocetBaliku);
          final brand = variantsList.first.znackaVyrobce;
          final country = variantsList.first.zemePuvodu;

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () async {
                final variants = <String, List<Zasoba>>{};
                for (var z in variantsList) {
                  final key = '${z.pocetKusu} ${AppLocalizations.of(context)!.translate('units')} • ${z.cenaZaKus} ${z.mena} • ${z.sklad}';
                  variants.putIfAbsent(key, () => []).add(z);
                }

                final Zasoba? chosen = await showDialog<Zasoba>(
                  context: context,
                  builder: (dialogContext) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      title: Text(AppLocalizations.of(context)!.translate('select_variant')),
                      content: SizedBox(
                        width: double.maxFinite,
                        child: ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (_, __) => const Divider(),
                          itemCount: variants.entries.length,
                          itemBuilder: (ctx, idx) {
                            final kv = variants.entries.elementAt(idx);
                            final first = kv.value.first;
                            final sumB = kv.value.fold<int>(0, (s, z) => s + z.pocetBaliku);
                            return ListTile(
                              leading: const Icon(Icons.inventory_2),
                              title: Text(
                                kv.key,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: sumB == 0 ? Colors.grey : null,
                                ),
                              ),
                              subtitle: Text(
                                '${AppLocalizations.of(context)!.translate('package_count')}: $sumB',
                                style: TextStyle(
                                  color: sumB == 0 ? Colors.red : null,
                                ),
                              ),
                              onTap: () {
                                if (sumB == 0) {
                                  ScaffoldMessenger.of(dialogContext).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        AppLocalizations.of(context)!.translate('no_packages_available'),
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor: Colors.red,
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );

                                } else {
                                  Navigator.pop(dialogContext, first);
                                }
                              },
                            );
                          },
                        ),
                      ),
                    );
                  },
                );

                if (chosen != null && widget.selectMode) {
                  final menaId = _findMenaId(chosen.mena);
                  final skladId = _findSkladId(chosen.sklad);

                  if (menaId == null || skladId == null) {
                    final missing = [];
                    if (menaId == null) missing.add('měnu "${chosen.mena}"');
                    if (skladId == null) missing.add('sklad "${chosen.sklad}"');

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${AppLocalizations.of(context)!.translate('failed_to_find')}: ${missing.join(" ${AppLocalizations.of(context)!.translate('and')} ")}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 3),
                      ),
                    );

                    return;
                  }

                  _showMovementForm(chosen, widget.movementType);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.indigo.shade200,
                      child: Text(
                        code[0].toUpperCase(),
                        style: const TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            code,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${AppLocalizations.of(context)!.translate('package_count')}: $totalPackages',
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            '${AppLocalizations.of(context)!.translate('manufacturer_brand')}: $brand',
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            '${AppLocalizations.of(context)!.translate('country_of_origin')}: $country',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 18),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

