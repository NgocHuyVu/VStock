class Kurz {
  final int id;
  final String menaZ;
  final String menaDo;
  final DateTime datumKurzu;
  final double kurz;

  Kurz({
    required this.id,
    required this.menaZ,
    required this.menaDo,
    required this.datumKurzu,
    required this.kurz,
  });

  factory Kurz.fromJson(Map<String, dynamic> json) {
    return Kurz(
      id: json['id'] as int,
      menaZ: json['mena_z'] as String,
      menaDo: json['mena_do'] as String,
      datumKurzu: DateTime.parse(json['datum_kurzu'] as String),
      kurz: (json['kurz'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'mena_z': menaZ,
    'mena_do': menaDo,
    'datum_kurzu': datumKurzu.toIso8601String(),
    'kurz': kurz,
  };
}