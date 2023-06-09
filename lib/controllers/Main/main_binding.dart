import 'package:agora_shop/controllers/Main/main_controller.dart';
import 'package:agora_shop/providers/Home_providers.dart/get_category_data_provider.dart';
import 'package:agora_shop/repositories/home_repository.dart';
import 'package:agora_shop/services/networking/home_api_service.dart';
import 'package:get/get.dart';
import '../../providers/Home_providers.dart/get_home_data_provider.dart';
import '../Client/client_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    ////////////HomeData/////////////////////////////////////////////////////////
    Get.lazyPut<HomeApiService>(() => HomeApiServiceImpWithHttp(
        clientController: Get.find<HttpClientController>()));
    Get.lazyPut<HomeRepository>(() =>
        HomeRepository(homeApiService: Get.find(), networkInfo: Get.find()));
    Get.lazyPut<GetHomeDataProvider>(() => GetHomeDataProvider(Get.find()));

    ///
    Get.lazyPut<GetCategoryDataProvider>(
        () => GetCategoryDataProvider(Get.find()));
  }
}
