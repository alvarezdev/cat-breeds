import 'package:dio/dio.dart';
import 'package:infrastructure/core/constants/config_constants.dart';

class DioFactory {

  Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ConfigConstants.getBreeds,
        headers: {
          ConfigConstants.header: ConfigConstants.value,
        },
        connectTimeout: const Duration(seconds: ConfigConstants.connectTimeout),
        receiveTimeout: const Duration(seconds: ConfigConstants.receiveTimeout),
      ),
    );

    return dio;
  }
}