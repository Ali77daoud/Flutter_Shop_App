import 'package:agora_shop/shared/network_info/network_info.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'controllers/Auth/auth_controller.dart';
import 'controllers/Client/client_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HttpClientController(), permanent: true);
    Get.put(InternetConnectionChecker(), permanent: true);
    Get.put<NetworkInfo>(NetworkInfoImpl(Get.find()), permanent: true);
    /////////////////////////////////////////////////////////////
    Get.put(AuthController(), permanent: true);
  }
}
