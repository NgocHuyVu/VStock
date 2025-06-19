import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'screens/zasoba_list_screen.dart';
import 'screens/produkt_list_screen.dart';
import 'screens/pohyby_zasob_screen.dart';
import 'screens/kurz_screen.dart';
import 'screens/sklad_list_screen.dart';
import 'screens/nastaveni_screen.dart';
import 'localization/app_localizations.dart';
import 'providers/language_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  LanguageProvider languageProvider = LanguageProvider();
  await languageProvider.loadLocale();

  runApp(
    ChangeNotifierProvider(
      create: (_) => languageProvider,
      child: const VStockApp(),
    ),
  );
}


class VStockApp extends StatelessWidget {
  const VStockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return MaterialApp(
          title: 'VStock',
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          locale: languageProvider.locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('cs', 'CZ'),
            Locale('vi', 'VN'),
            Locale('en', 'EN')
          ],
          home: const HomeScreen(),
        );
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    ZasobaListScreen(),
    PohybyZasobScreen(),
    ProduktListScreen(),
    SkladListScreen(),
    KurzScreen(),
    NastaveniScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color _getSelectedColor(int index) {
    switch (index) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.indigo;
      case 2:
        return Colors.blueAccent;
      case 3:
        return Colors.teal;
      case 4:
        return Colors.orange;
      case 5:
        return Colors.deepPurple;
      default:
        return Colors.blueAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: _getSelectedColor(_selectedIndex),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 10,
          ),
          iconSize: 26,
          selectedFontSize: 32,
          unselectedFontSize: 30,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.only(bottom: 4),
                width: 40,
                child: const Icon(Icons.inventory),
              ),
              label: AppLocalizations.of(context)!.translate('inventory'),
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.only(bottom: 4),
                width: 40,
                child: const Icon(Icons.swap_horiz),
              ),
              label: AppLocalizations.of(context)!.translate('movements'),
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.only(bottom: 4),
                width: 40,
                child: const Icon(Icons.shopping_bag),
              ),
              label: AppLocalizations.of(context)!.translate('products'),
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.only(bottom: 4),
                width: 40,
                child: const Icon(Icons.warehouse),
              ),
              label: AppLocalizations.of(context)!.translate('warehouses'),
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.only(bottom: 4),
                width: 40,
                child: const Icon(Icons.currency_exchange),
              ),
              label: AppLocalizations.of(context)!.translate('exchange_rate'),
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.only(bottom: 4),
                width: 40,
                child: const Icon(Icons.settings),
              ),
              label: AppLocalizations.of(context)!.translate('settings'),
            ),
          ],
        ),
      ),
    );
  }
}