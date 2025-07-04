class Produkt {
  final int? id;
  final String nazev;
  final String kodProduktu;
  final String kategorie;
  final String znackaVyrobce;
  final String zemePuvodu;


  Produkt({
    this.id,
    required this.nazev,
    required this.kodProduktu,
    required this.kategorie,
    required this.znackaVyrobce,
    required this.zemePuvodu,
  });

  factory Produkt.fromJson(Map<String, dynamic> json) {
    return Produkt(
      id: json['id'],
      nazev: json['nazev'] ?? 'Nemá název',
      kodProduktu: json['kod_produktu'],
      kategorie: json['kategorie'],
      znackaVyrobce: json['znacka_vyrobce'],
      zemePuvodu: json['zeme_puvodu'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'nazev': nazev,
      'kod_produktu': kodProduktu,
      'kategorie': kategorie,
      'znacka_vyrobce': znackaVyrobce,
      'zeme_puvodu': zemePuvodu,
    };
  }
}
