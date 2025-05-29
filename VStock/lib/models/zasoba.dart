class Zasoba {
  final int id;
  final String produkt;
  final String kodProduktu;
  final String nazevProduktu;
  final String kategorie;
  final String znackaVyrobce;
  final String zemePuvodu;
  final String sklad;
  final int pocetKusu;
  final double cenaZaKus;
  final String mena;
  final int pocetBaliku;

  Zasoba({
    required this.id,
    required this.produkt,
    required this.kodProduktu,
    required this.nazevProduktu,
    required this.kategorie,
    required this.znackaVyrobce,
    required this.zemePuvodu,
    required this.sklad,
    required this.pocetKusu,
    required this.cenaZaKus,
    required this.mena,
    required this.pocetBaliku,
  });

  factory Zasoba.fromJson(Map<String, dynamic> json) {
    return Zasoba(
      id: json['id'],
      produkt: json['produkt'].toString(),
      kodProduktu: json['kod_produktu'],
      nazevProduktu: json['nazev_produktu'],
      kategorie: json['kategorie'],
      znackaVyrobce: json['znacka_vyrobce'],
      zemePuvodu: json['zeme_puvodu'],
      sklad: json['sklad'],
      pocetKusu: json['pocet_kusu_v_baleni'],
      cenaZaKus: json['cena_za_kus'],
      mena: json['mena'],
      pocetBaliku: json['pocet_baliku_ve_skladu'],
    );
  }
}
