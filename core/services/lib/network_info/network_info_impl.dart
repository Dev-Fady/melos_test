import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:services/network_info/network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final isConnectedToNetwork =
        connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi;
    return isConnectedToNetwork;
  }
}
