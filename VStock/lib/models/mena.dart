class Mena {
  final int id;
  final String nazev;
  final String isoKodMeny;
  final String symbolMeny;

  Mena({
    required this.id,
    required this.nazev,
    required this.isoKodMeny,
    required this.symbolMeny,
  });

  factory Mena.fromJson(Map<String, dynamic> json) {
    return Mena(
      id: json['id'],
      nazev: json['nazev'],
      isoKodMeny: json['iso_kod_meny'],
      symbolMeny: json['symbol_meny'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nazev': nazev,
      'iso_kod_meny': isoKodMeny,
      'symbol_meny': symbolMeny,
    };
  }
}
