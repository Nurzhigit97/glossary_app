import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glossary_app/data/models/glossary_model.dart';

class GlossaryRepo {
  Dio _dio = Dio();

  String endpoint = 'http://192.168.43.127:8000/api/glossary/view/all/';
  //! for emulator http://10.0.2.2:8000/
  //!real device http://192.168.43.127:8000/
//! Get AllUsers
  Future<List<GlossaryModel>> getGlossary({String? glossaryValue}) async {
    final res = await _dio.get(
      '${endpoint}?=${glossaryValue}',
    );
    if (res.statusCode == 200) {
      final decoded = res.data;
      final List<dynamic> result = decoded;
      return result.map(((e) => GlossaryModel.fromJson(e))).toList();
    } else {
      throw Exception(res.statusCode);
    }
  }
}

//! provider stateManagement for get data on all pages
//? Provider(type)<ApiServices>(from)((ref)=>ApiServices())
final userProvider = Provider<GlossaryRepo>((ref) => GlossaryRepo());
