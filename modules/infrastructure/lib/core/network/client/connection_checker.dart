import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectionChecker {
  final InternetConnectionChecker _checker;

  ConnectionChecker._(this._checker);

  factory ConnectionChecker.create() {
    return ConnectionChecker._(
      InternetConnectionChecker.createInstance(
        checkTimeout: const Duration(seconds: 1),
        checkInterval: const Duration(seconds: 1),
      ),
    );
  }

  Future<bool> get hasConnection => _checker.hasConnection;
}