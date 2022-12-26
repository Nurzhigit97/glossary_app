import 'package:dio/dio.dart';
import 'package:glossary_app/data/models/glossary_model.dart';

class GlossaryRepo {
  Dio _dio;

  GlossaryRepo(this._dio);
  // String endpoint = 'http://192.168.43.127:8000/api/glossary/view/all/';
  String endpoint = 'http://192.168.43.127:8000/api/glossary/view/all/';
  String endpointDetail = 'http://192.168.43.127:8000/api/glossary/detail/';
//   //! for emulator http://10.0.2.2:8000/
//   //!real device http://192.168.43.127:8000/

  Future<List<GlossaryModel>> getAll({String? query}) async {
    Response response = await _dio.get(endpoint);
    try {
      final data = await response.data as List;
      final resData = data.map((json) => GlossaryModel.fromJson(json));
      return resData.where((glossary) {
        final titleLower = glossary.title?.toLowerCase().trim();
        final searchLower = query!.toLowerCase().trim();

        // if (searchLower.contains('все')) {
        //   return titleLower!.contains('');
        // }
        // if (searchLower.contains('0-9')) {
        //   return titleLower!.contains('');
        // }
        // if (searchLower.isNotEmpty) {
        //   return titleLower!.startsWith(searchLower);
        // }
        return titleLower!.contains(searchLower);
      }).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<GlossaryModel>> getFavourites() async {
    Response response = await _dio.get(endpoint);
    try {
      final data = await response.data as List;
      final resData = data.map((json) => GlossaryModel.fromJson(json));
      return resData.where((glossary) {
        final titleLower = glossary.isFavourite;
        return titleLower!;
      }).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<GlossaryModel>> updateisFavourite(
      {id, title, description, isFavourite}) async {
    try {
      Response response = await _dio.put(
        endpointDetail + '$id/',
        data: {
          'title': title,
          'description': description,
          'isFavourite': !isFavourite,
        },
      );
      final data = await response.data as List;
      final resData = data.map((json) => GlossaryModel.fromJson(json)).toList();
      return resData;
    } catch (e) {
      throw Exception(e);
    }
  }
}
