import 'package:agora_shop/controllers/Client/client_controller.dart';
import 'package:agora_shop/controllers/Profile/profile_controller.dart';
import 'package:agora_shop/providers/Profile_providers/get_user_data_provider.dart';
import 'package:agora_shop/providers/Profile_providers/update_profile_provider.dart';
import 'package:agora_shop/repositories/profile_repository.dart';
import 'package:agora_shop/services/networking/profile_api_service.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
    ////// profile /////////////////////////////////////
    Get.lazyPut<ProfileApiService>(() => ProfileApiServiceImpWithHttp(
        clientController: Get.find<HttpClientController>()));
    Get.lazyPut<ProfileRepository>(() => ProfileRepository(
        profileApiService: Get.find(), networkInfo: Get.find()));
    Get.lazyPut<UpdateProfileProvider>(() => UpdateProfileProvider(Get.find()));
    Get.lazyPut<GetUserDataProvider>(() => GetUserDataProvider(Get.find()),
        fenix: true);
  }
}
