import 'package:agora_shop/controllers/Auth/auth_controller.dart';
import 'package:agora_shop/providers/Auth_providers.dart/login_provider.dart';
import 'package:agora_shop/providers/Auth_providers.dart/register_provider.dart';
import 'package:agora_shop/repositories/auth_repository.dart';
import 'package:agora_shop/services/networking/auth_api_service.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    ///////////Auth///////////////////////////////////////////////////////////////
    Get.lazyPut<AuthApiService>(
        () => AuthApiServiceImpWithHttp(client: Get.find()));
    Get.lazyPut<AuthRepository>(() =>
        AuthRepository(networkInfo: Get.find(), authApiService: Get.find()));
    Get.lazyPut<LoginProvider>(() => LoginProvider(Get.find()));
    Get.lazyPut<RegisterProvider>(() => RegisterProvider(Get.find()));
    /////////////////////////////////////////////////////////////
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
  }
}
