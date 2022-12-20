import 'package:dio/dio.dart';
import 'package:glossary_app/data/models/glossary_model.dart';

class GlossaryRepo {
  Dio _dio;

  GlossaryRepo(this._dio);
  String endpoint = 'http://192.168.43.127:8000/api/glossary/view/all/';
//   //! for emulator http://10.0.2.2:8000/
//   //!real device http://192.168.43.127:8000/

  fetchGlossary() async {
    try {
      final response = await _dio.get(endpoint);
      final decoded = response.data;
      final List<dynamic> result = decoded;
      return result.map(((e) => GlossaryModel.fromJson(e))).toList();
    } catch (err) {
      return Future.error(err);
    }
  }
}
