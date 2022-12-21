import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:glossary_app/data/models/glossary_model.dart';
import 'package:http/http.dart' as http;

class GlossaryRepo {
  Dio _dio;

  GlossaryRepo(this._dio);
  String endpoint = 'http://192.168.43.127:8000/api/glossary/view/all/';
//   //! for emulator http://10.0.2.2:8000/
//   //!real device http://192.168.43.127:8000/

  Future<List<GlossaryModel>> getAll() async {
    final url = Uri.parse(endpoint);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(utf8.decode(response.bodyBytes)) as List;
      final result = json.map((e) {
        return GlossaryModel(
          id: e['id'],
          title: e['title'],
          description: e['discraption'],
        );
      }).toList();
      return result;
    } else {
      throw "Error in fetch: ${response.statusCode}";
    }
  }
}
