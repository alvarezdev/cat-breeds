
import 'package:dio/dio.dart';
import 'package:infrastructure/core/network/client/connection_checker.dart';

class ApiClient {
  final Dio _dio;
  final ConnectionChecker _connectionChecker;

  ApiClient({
    required Dio dio,
    required ConnectionChecker connectionChecker,
  })  : _dio = dio,
        _connectionChecker = connectionChecker;

  Future<dynamic> get(String endpoint, {Map<String, dynamic>? queryParams}) async {
    return _request(() => _dio.get(endpoint, queryParameters: queryParams));
  }

  Future<dynamic> post(String endpoint, {dynamic data}) async {
    return _request(() => _dio.post(endpoint, data: data));
  }

  Future<dynamic> put(String endpoint, {dynamic data}) async {
    return _request(() => _dio.put(endpoint, data: data));
  }

  Future<dynamic> delete(String endpoint) async {
    return _request(() => _dio.delete(endpoint));
  }

  Future<dynamic> _request(Future<Response> Function() request) async {
    if (!await _connectionChecker.hasConnection) {
      throw Exception('No internet connection');
    }
    try {
      final response = await request();

      final data = response.data;
      return data;
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }
}
