import 'package:dio/dio.dart';
import 'package:glossary_app/data/models/glossary_model.dart';

class GlossaryRepo {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.43.127:8000/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );
  final String endpointAll = 'api/glossary/view/all/';
  final String endpointDetail = 'api/glossary/detail/';
//   //! for emulator http://10.0.2.2:8000/
//   //!real device http://192.168.43.127:8000/

  Future<List<GlossaryModel>> searchGlossary({String? query}) async {
    final response = await _dio.get(endpointAll);
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
    } on DioError catch (err) {
      throw Exception(err.message);
    }
  }

  Future<List<GlossaryModel>> getGlossaries() async {
    final response = await _dio.get(endpointAll);
    try {
      final data = await response.data;
      final List<dynamic> result = data;
      return result.map(((e) => GlossaryModel.fromJson(e))).toList();
    } on DioError catch (err) {
      throw Exception(err.message);
    }
  }

  Future<GlossaryModel?> getGlossary({required String id}) async {
    GlossaryModel? user;

    try {
      Response userData = await _dio.get(endpointDetail + id);

      user = GlossaryModel.fromJson(userData.data);
    } on DioError catch (err) {
      if (err.response != null) {
      } else {
        throw Exception(err.message);
      }
    }

    return user;
  }

  Future<GlossaryModel?> addGlossary(
      {required GlossaryModel modelGlossary}) async {
    try {
      await _dio.post(
        endpointAll,
        data: modelGlossary,
      );
    } on DioError catch (err) {
      throw Exception(err.message);
    }
    return null;
  }

  Future<List<GlossaryModel>> getFavourites() async {
    Response response = await _dio.get(endpointAll);
    try {
      final data = await response.data as List;
      final resData = data.map((json) => GlossaryModel.fromJson(json));
      return resData.where((glossary) {
        final titleLower = glossary.isFavourite;
        return titleLower;
      }).toList();
    } on DioError catch (err) {
      throw Exception(err.message);
    }
  }

  Future updateFavourite({required int id, required bool isFavourite}) async {
    try {
      await _dio.patch(
        endpointDetail + '$id/',
        data: {
          'isFavourite': isFavourite,
        },
      );
    } on DioError catch (err) {
      throw Exception(err.message);
    }
  }
}
