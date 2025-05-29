import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/produkt.dart';
import '../models/zasoba.dart';
import '../models/pohyb_zasob.dart';
import '../models/mena.dart';
import '../models/sklad.dart';
import '../models/kurz.dart';
class ApiService {
  final String baseUrl = 'http://10.0.2.2:8000/api'; // Emulátor Android

  Future<List<String>> getZemePuvodu() async {
    final response = await http.get(Uri.parse('$baseUrl/zeme-puvodu'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => item['name'] as String).toList();
    } else {
      throw Exception('Nepodařilo se načíst země původu');
    }
  }

  Future<List<String>> getZnackyVyrobce() async {
    final response = await http.get(Uri.parse('$baseUrl/znacky-vyrobce'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => item['name'] as String).toList();
    } else {
      throw Exception('Nepodařilo se načíst značky vyrbce');
    }
  }

  Future<List<String>> getKategorie() async {
    final response = await http.get(Uri.parse('$baseUrl/kategorie'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => item['name'] as String).toList();
    } else {
      throw Exception('Nepodařilo se načíst kategorie');
    }
  }

  Future<List<Produkt>> getProdukty() async {
    final response = await http.get(Uri.parse('$baseUrl/produkty/'));
    if (response.statusCode == 200) {
      final decodedBody = utf8.decode(response.bodyBytes);
      final List data = json.decode(decodedBody);
      return data.map((e) => Produkt.fromJson(e)).toList();
    } else {
      throw Exception('Nepodařilo se načíst produkty');
    }
  }

  Future<void> createProdukt(Produkt produkt) async {
    final response = await http.post(
      Uri.parse('$baseUrl/produkty/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(produkt.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Nepodařilo se přidat produkt');
    }
  }

  Future<void> updateProdukt(Produkt produkt) async {
    if (produkt.id == null) {
      throw Exception('Produkt ID je null – nelze aktualizovat');
    }

    final response = await http.put(
      Uri.parse('$baseUrl/produkty/${produkt.id}/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(produkt.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Nepodařilo se aktualizovat produkt');
    }
  }

  Future<void> deleteProdukt(int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/produkty/$id/'),
    );

    if (response.statusCode != 204) {
      throw Exception('Nepodařilo se smazat produkt');
    }
  }

  Future<List<Zasoba>> getZasoby() async {
    final response = await http.get(Uri.parse('$baseUrl/zasoby/'));
    if (response.statusCode == 200) {
      final decodedBody = utf8.decode(response.bodyBytes);
      final List data = json.decode(decodedBody);
      return data.map((e) => Zasoba.fromJson(e)).toList();
    } else {
      throw Exception('Nepodařilo se načíst zásoby');
    }
  }

  Future<List<PohybZasob>> getPohybyZasob() async {
    final response = await http.get(Uri.parse('$baseUrl/pohyby-zasob/'));
    if (response.statusCode == 200) {
      final decodedBody = utf8.decode(response.bodyBytes);
      final List data = json.decode(decodedBody);
      return data.map((e) => PohybZasob.fromJson(e)).toList();
    } else {
      throw Exception('Nepodařilo se načíst pohyby zásob');
    }
  }

  Future<void> createPohybZasob(PohybZasob pohyb) async {
    final response = await http.post(
      Uri.parse('$baseUrl/pohyby-zasob/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(pohyb.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Nepodařilo se přidat pohyb zásob');
    }
    if (response.statusCode == 400) {
      print('Validation errors: ${response.body}');
    }
  }

  Future<List<Mena>> getMeny() async {
    final response = await http.get(Uri.parse('$baseUrl/meny'));
    if (response.statusCode == 200) {
      final decodedBody = utf8.decode(response.bodyBytes);
      final List data = json.decode(decodedBody);
      return data.map((e) => Mena.fromJson(e)).toList();
    } else {
      throw Exception('Nepodařilo se načíst měny');
    }
  }

  Future<List<Sklad>> getSklady() async {
    final response = await http.get(Uri.parse('$baseUrl/sklady'));
    if (response.statusCode == 200) {
      final decodedBody = utf8.decode(response.bodyBytes);
      final List data = json.decode(decodedBody);
      return data.map((e) => Sklad.fromJson(e)).toList();
    } else {
      throw Exception('Nepodařilo se načíst sklady');
    }
  }
  Future<void> createSklad(Sklad sklad) async {
    final response = await http.post(
      Uri.parse('$baseUrl/sklady/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(sklad.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Nepodařilo se přidat sklad');
    }
  }

  Future<void> updateSklad(Sklad sklad) async {
    if (sklad.id == null) {
      throw Exception('Sklad ID je null – nelze aktualizovat');
    }

    final response = await http.put(
      Uri.parse('$baseUrl/sklady/${sklad.id}/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(sklad.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Nepodařilo se aktualizovat sklad');
    }
  }
  Future<void> deleteSklady(int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/sklady/$id/'),
    );

    if (response.statusCode != 204) {
      throw Exception('Nepodařilo se smazat produkt');
    }
  }
  Future<List<Kurz>> getKurzyMeny() async {
    final response = await http.get(Uri.parse('$baseUrl/kurzy-meny/'));

    if (response.statusCode == 200) {
      final decodedBody = utf8.decode(response.bodyBytes);
      final List data = json.decode(decodedBody);
      return data.map((e) => Kurz.fromJson(e)).toList();
    } else {
      throw Exception('Nepodařilo se načíst kurzy měn');
    }
  }
}