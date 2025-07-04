class PohybZasob {
  final int? id;
  final String produkt;
  final String? odchoziSklad;
  final String? cilovySklad;
  final int typPohybu;
  final String datumPohybu;
  final int pocetKusuVBaleni;
  final double cenaZaKus;
  final String mena;
  final int pocetBalikuVPohybu;

  PohybZasob({
    this.id,
    required this.produkt,
    this.odchoziSklad,
    this.cilovySklad,
    required this.typPohybu,
    required this.datumPohybu,
    required this.pocetKusuVBaleni,
    required this.cenaZaKus,
    required this.mena,
    required this.pocetBalikuVPohybu,
  });

  factory PohybZasob.fromJson(Map<String, dynamic> json) {
    return PohybZasob(
      id: json['id'],
      produkt: json['produkt'] ?? 'Neznámý produkt',
      odchoziSklad: json['odchozi_sklad'],
      cilovySklad: json['cilovy_sklad'],
      typPohybu: json['typ_pohybu'],
      datumPohybu: json['datum_pohybu'],
      pocetKusuVBaleni: json['pocet_kusu_v_baleni'],
      cenaZaKus: (json['cena_za_kus'] as num).toDouble(),
      mena: json['mena'] ?? 'Neznámá měna',
      pocetBalikuVPohybu: json['pocet_baliku_v_pohybu'],
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'produkt': produkt,
      'typ_pohybu': typPohybu,
      'datum_pohybu': datumPohybu,
      'pocet_kusu_v_baleni': pocetKusuVBaleni,
      'cena_za_kus': cenaZaKus,
      'mena': mena,
      'pocet_baliku_v_pohybu': pocetBalikuVPohybu,
    };

    if (typPohybu == 1) { // Příjem
      json['odchozi_sklad'] = null;
      json['cilovy_sklad'] = cilovySklad;
    } else if (typPohybu == 2) { // Výdej
      json['cilovy_sklad'] = null;
      json['odchozi_sklad'] = odchoziSklad;
    } else if (typPohybu == 3) { // Přesun
      json['odchozi_sklad'] = odchoziSklad;
      json['cilovy_sklad'] = cilovySklad;
    }

    if (id != null) {
      json['id'] = id!;
    }
    return json;
  }
}