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
    Response response = await _dio.get(endpoint);

    final data = await response.data as List;
    return data.map((x) => GlossaryModel.fromJson(x)).toList();
  }
}
