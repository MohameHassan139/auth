import 'package:dio/dio.dart';

import 'dio_config.dart';

class ApiService {
  ApiService._();

  static final ApiService api = ApiService._();
  final Dio _dio = DioConfig.getDio();

  Future<Map<String, dynamic>> get({required String quray}) async {
    Response response = await _dio.get(quray);

    return response.data;
  }
    Future<Map<String, dynamic>> post({
    required String quray,
    String? token,
    String? contentType,
    Object? data,
  }) async {
    Response response = await _dio.post(
      quray,
      data: data,
      options: Options(
        contentType: contentType,
      ),
    );

    return response.data;
  }
}
