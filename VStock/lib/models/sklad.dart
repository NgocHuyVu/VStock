class Sklad {
  final int? id;
  final String nazev;

  Sklad({
    this.id,
    required this.nazev,
  });

  factory Sklad.fromJson(Map<String, dynamic> json) {
    return Sklad(
      id: json['id'],
      nazev: json['nazev'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nazev': nazev,
    };
  }
}
