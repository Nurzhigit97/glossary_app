import 'package:dio/dio.dart';
import 'package:glossary_app/data/models/glossary_model.dart';

class CheckGlossaryRepo {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.43.127:8000/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );
  final String endpointAll = 'api/addedGlossaryByUser/view/all/';
  final String endpointDetail = 'api/addedGlossaryByUser/detail/';

  Future<List<GlossaryModel>> getGlossariesAddedByUser() async {
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

  Future<void> addToAdminPanel({
    required GlossaryModel modelGlossary,
  }) async {
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

  Future<void> deleteGlossaryAafterChecked({required id}) async {
    try {
      await _dio.delete(
        endpointDetail + '${id}/',
      );
    } on DioError catch (err) {
      throw Exception(err.message);
    }
    return null;
  }
}
