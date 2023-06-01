import 'package:agora_shop/shared/network_info/network_info.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(http.Client(), permanent: true);
    Get.put(InternetConnectionChecker(), permanent: true);
    Get.put<NetworkInfo>(NetworkInfoImpl(Get.find()), permanent: true);
  }
}
