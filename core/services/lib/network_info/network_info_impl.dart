import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:services/network_info/network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker checker;

  NetworkInfoImpl(this.checker);

  @override
  Future<bool> get isConnected => checker.hasConnection;
}
