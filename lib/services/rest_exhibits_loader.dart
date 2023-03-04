import 'dart:convert';

import 'package:flutter_test_tast_kirkach_k/models/exhibit.dart';
import 'package:flutter_test_tast_kirkach_k/models/exhibits_loader.dart';
import 'package:http/http.dart' as http;

class RestExhibitsLoader implements ExhibitsLoader {
  final String _url =
      'https://my-json-server.typicode.com/Reyst/exhibit_db/list';

  @override
  Future<List<Exhibit>> getExhibitList() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      final List<Exhibit> exhibits = json
          .map((e) => Exhibit(
                title: e['title'],
                images: List<String>.from(e['images']),
              ))
          .toList();
      return exhibits;
    } else {
      throw Exception('Failed to load exhibit list');
    }
  }
}
