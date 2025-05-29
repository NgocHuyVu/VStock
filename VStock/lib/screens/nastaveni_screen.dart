import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../localization/app_localizations.dart';
import '../providers/language_provider.dart';

class NastaveniScreen extends StatefulWidget {
  const NastaveniScreen({Key? key}) : super(key: key);

  @override
  _NastaveniScreenState createState() => _NastaveniScreenState();
}

class _NastaveniScreenState extends State<NastaveniScreen> {
  late SharedPreferences _prefs;
  String _selectedLanguage = 'cs';

  @override
  void initState() {
    super.initState();
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedLanguage = _prefs.getString('language') ?? 'cs';
    });
  }

  Future<void> _changeLanguage(String languageCode) async {
    await _prefs.setString('language', languageCode);
    setState(() {
      _selectedLanguage = languageCode;
    });

    final provider = Provider.of<LanguageProvider>(context, listen: false);
    if (languageCode == 'cs') {
      provider.setLocale(const Locale('cs', 'CZ'));
    } else if (languageCode == 'vi') {
      provider.setLocale(const Locale('vi', 'VN'));
    } else if (languageCode == 'en') {
      provider.setLocale(const Locale('en', 'EN'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.translate('settings'),
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.translate('choose_language'),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildLanguageOption(
                AppLocalizations.of(context)!.translate('czech'),
                'cs',
                'assets/flags/cz.png'
            ),
            _buildLanguageOption(
                AppLocalizations.of(context)!.translate('vietnamese'),
                'vi',
                'assets/flags/vn.png'
            ),
            _buildLanguageOption(
              AppLocalizations.of(context)!.translate('english'),
              'en',
              'assets/flags/en.png',
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        AppLocalizations.of(context)!.translate('settings_saved')
                      ),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                child: Text(
                  AppLocalizations.of(context)!.translate('save_settings'),
                  style: const TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(String title, String languageCode, String flagAsset) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Image.asset(
          flagAsset,
          width: 30,
          height: 20,
          fit: BoxFit.cover,
        ),
        title: Text(title),
        trailing: Radio<String>(
          value: languageCode,
          groupValue: _selectedLanguage,
          activeColor: Colors.blueAccent,
          onChanged: (String? value) {
            if (value != null) {
              _changeLanguage(value);
            }
          },
        ),
      ),
    );
  }
}