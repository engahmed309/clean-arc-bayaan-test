import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final baseUrl = 'http://first.byaan.org';

  ApiService(this._dio);
  Future<Map<String, dynamic>> getdata({required String endPoint}) async {
    var response = await _dio.get("$baseUrl$endPoint");
    return await response.data;
  }
}
