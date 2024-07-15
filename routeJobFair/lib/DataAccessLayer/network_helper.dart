import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class CheckNetworkConnection {
  Future checkNetworkConnection() async {
    if (kIsWeb) {
      // final response = await InternetAddress.lookup('https://www.google.com/');
      // if (response.isNotEmpty) {
      return true;
      // } else {
      //   return false;
      // }
    } else {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult == ConnectivityResult.mobile) {
        // I am connected to a mobile network.
        return true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        //   I am connected to a wifi network.
        return true;
      } else {
        return false;
      }
    }
  }
}
