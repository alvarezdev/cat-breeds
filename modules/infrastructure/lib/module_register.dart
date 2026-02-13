import 'package:dio/dio.dart';
import 'package:infrastructure/core/constants/config_constants.dart';
import 'package:infrastructure/core/network/client/api_client.dart';
import 'package:infrastructure/core/network/connection_checker.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {

  @lazySingleton
  Dio dio() => Dio(
      BaseOptions(
        baseUrl: ConfigConstants.baseUrl,
        headers: {
          ConfigConstants.header: ConfigConstants.value,
        },
      ),
    );
  
  @lazySingleton
  ConnectionChecker get connectionChecker => ConnectionChecker.create();

  @lazySingleton
  ApiClient apiClient(Dio dio, ConnectionChecker checker) =>
      ApiClient(dio: dio, connectionChecker: checker);
}