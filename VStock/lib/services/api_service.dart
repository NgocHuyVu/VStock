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
  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'X-API-Secret': 'vas_tajny_klic!@#123',
  };

  // Helper method for GET requests
  Future<dynamic> _getRequest(String endpoint) async {
    final response = await http.get(
      Uri.parse('$baseUrl/$endpoint'),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      final decodedBody = utf8.decode(response.bodyBytes);
      return json.decode(decodedBody);
    } else {
      throw Exception('Nepodařilo se načíst data z $endpoint');
    }
  }

  // Helper method for POST requests
  Future<void> _postRequest(String endpoint, dynamic data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: _headers,
      body: json.encode(data),
    );

    if (response.statusCode != 201) {
      throw Exception('Nepodařilo se vytvořit data na $endpoint');
    }
  }

  // Helper method for PUT requests
  Future<void> _putRequest(String endpoint, dynamic data, {int? id}) async {
    if (id == null && endpoint.endsWith('/')) {
      throw Exception('Pro aktualizaci je vyžadován průkaz totožnosti');
    }

    final url = id != null ? '$baseUrl/$endpoint$id/' : '$baseUrl/$endpoint';
    final response = await http.put(
      Uri.parse(url),
      headers: _headers,
      body: json.encode(data),
    );

    if (response.statusCode != 200) {
      throw Exception('Nepodařilo se aktualizovat data na $endpoint');
    }
  }

  // Helper method for DELETE requests
  Future<void> _deleteRequest(String endpoint, int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/$endpoint$id/'),
      headers: _headers,
    );

    if (response.statusCode != 204) {
      throw Exception('Nepodařilo se aktualizovat data na $endpoint');
    }
  }

  Future<List<String>> getZemePuvodu() async {
    final data = await _getRequest('zeme-puvodu');
    return data.map<String>((item) => item['name'] as String).toList();
  }

  Future<List<String>> getZnackyVyrobce() async {
    final data = await _getRequest('znacky-vyrobce');
    return data.map<String>((item) => item['name'] as String).toList();
  }

  Future<List<String>> getKategorie() async {
    final data = await _getRequest('kategorie');
    return data.map<String>((item) => item['name'] as String).toList();
  }

  Future<List<Produkt>> getProdukty() async {
    final data = await _getRequest('produkty/');
    return data.map<Produkt>((e) => Produkt.fromJson(e)).toList();
  }

  Future<void> createProdukt(Produkt produkt) async {
    await _postRequest('produkty/', produkt.toJson());
  }

  Future<void> updateProdukt(Produkt produkt) async {
    await _putRequest('produkty/', produkt.toJson(), id: produkt.id);
  }

  Future<void> deleteProdukt(int id) async {
    await _deleteRequest('produkty/', id);
  }

  Future<List<Zasoba>> getZasoby() async {
    final data = await _getRequest('zasoby/');
    return data.map<Zasoba>((e) => Zasoba.fromJson(e)).toList();
  }

  Future<List<PohybZasob>> getPohybyZasob() async {
    final data = await _getRequest('pohyby-zasob/');
    return data.map<PohybZasob>((e) => PohybZasob.fromJson(e)).toList();
  }

  Future<void> createPohybZasob(PohybZasob pohyb) async {
    try {
      await _postRequest('pohyby-zasob/', pohyb.toJson());
    } catch (e) {
      if (e.toString().contains('400')) {
        print('Chyby ověření: ${e.toString()}');
      }
      rethrow;
    }
  }

  Future<List<Mena>> getMeny() async {
    final data = await _getRequest('meny');
    return data.map<Mena>((e) => Mena.fromJson(e)).toList();
  }

  Future<List<Sklad>> getSklady() async {
    final data = await _getRequest('sklady');
    return data.map<Sklad>((e) => Sklad.fromJson(e)).toList();
  }

  Future<void> createSklad(Sklad sklad) async {
    await _postRequest('sklady/', sklad.toJson());
  }

  Future<void> updateSklad(Sklad sklad) async {
    await _putRequest('sklady/', sklad.toJson(), id: sklad.id);
  }

  Future<void> deleteSklady(int id) async {
    await _deleteRequest('sklady/', id);
  }

  Future<List<Kurz>> getKurzyMeny() async {
    final data = await _getRequest('kurzy-meny/');
    return data.map<Kurz>((e) => Kurz.fromJson(e)).toList();
  }
}