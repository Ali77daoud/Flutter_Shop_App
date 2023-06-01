import 'package:agora_shop/controllers/Main/main_controller.dart';
import 'package:agora_shop/repositories/home_repository.dart';
import 'package:agora_shop/services/networking/home_api_service.dart';
import 'package:get/get.dart';
import '../../providers/Category_providers.dart/get_categories_provider.dart';
import '../../providers/Home_providers.dart/get_home_data_provider.dart';
import '../../providers/Product_providers.dart/get_products_provider.dart';
import '../../repositories/category_repository.dart';
import '../../repositories/product_repository.dart';
import '../../services/networking/category_api_service.dart';
import '../../services/networking/product_api_service.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    ////////////HomeData/////////////////////////////////////////////////////////
    Get.lazyPut<HomeApiService>(
        () => HomeApiServiceImpWithHttp(client: Get.find()));
    Get.lazyPut<HomeRepository>(() =>
        HomeRepository(homeApiService: Get.find(), networkInfo: Get.find()));
    //
    Get.lazyPut<GetHomeDataProvider>(() => GetHomeDataProvider(Get.find()));
    ////////////Category/////////////////////////////////////////////////////////
    Get.lazyPut<CategoryApiService>(
        () => CategoryApiServiceImpWithHttp(client: Get.find()));
    Get.lazyPut<CategoryRepository>(() => CategoryRepository(
        categoryApiService: Get.find(), networkInfo: Get.find()));
    Get.lazyPut<GetCategoriesProvider>(() => GetCategoriesProvider(Get.find()));
    ////////////Product/////////////////////////////////////////////////////////
    Get.lazyPut<ProductApiService>(
        () => ProductApiServiceImpWithHttp(client: Get.find()));
    Get.lazyPut<ProductRepository>(() => ProductRepository(
        networkInfo: Get.find(), productApiService: Get.find()));
    Get.lazyPut<GetProductsProvider>(() => GetProductsProvider(Get.find()));
    ///////////////Controlles//////////////////////////////////////////////////
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    // Get.lazyPut<HomeController>(
    //   () => HomeController(),
    // );
    // Get.lazyPut<CartController>(
    //   () => CartController(),
    // );
    // Get.lazyPut<FavouriteController>(
    //   () => FavouriteController(),
    // );
    // Get.lazyPut<ProfileController>(
    //   () => ProfileController(),
    // );
  }
}
