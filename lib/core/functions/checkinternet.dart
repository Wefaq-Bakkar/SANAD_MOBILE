import 'dart:developer';
import 'dart:io';

checkInternet() async {
  try {
    var result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      log("INTERNET Is $result", name: 'PING');

      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}
