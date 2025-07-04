import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  Locale _locale = const Locale('cs', 'CZ');

  Locale get locale => _locale;

  Future<void> loadLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('language');

    if (languageCode != null) {
      if (languageCode == 'cs') {
        _locale = const Locale('cs', 'CZ');
      } else if (languageCode == 'vi') {
        _locale = const Locale('vi', 'VN');
      } else if (languageCode == 'en') {
        _locale = const Locale('en', 'EN');
      }
      notifyListeners();
    }
  }

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}
