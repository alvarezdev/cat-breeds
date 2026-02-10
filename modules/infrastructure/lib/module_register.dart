import 'package:dio/dio.dart';
import 'package:infrastructure/core/constants/config_constants.dart';
import 'package:infrastructure/core/network/client/api_client.dart';
import 'package:infrastructure/core/network/client/connection_checker.dart';
import 'package:infrastructure/core/network/client/dio_factory.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {

  @lazySingleton
  Dio dio(DioFactory dioFactory) {
    return Dio(
      BaseOptions(
        baseUrl: ConfigConstants.getBreeds,
        headers: {
          ConfigConstants.header: ConfigConstants.value,
        },
        connectTimeout: const Duration(seconds: ConfigConstants.connectTimeout),
        receiveTimeout: const Duration(seconds: ConfigConstants.receiveTimeout),
      ),
    );
  }
  
  @lazySingleton
  ConnectionChecker get connectionChecker => ConnectionChecker.create();

  @lazySingleton
  ApiClient apiClient(Dio dio, ConnectionChecker checker) =>
      ApiClient(dio: dio, connectionChecker: checker);
}