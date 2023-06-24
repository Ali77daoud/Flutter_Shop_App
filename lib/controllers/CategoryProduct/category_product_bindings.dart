import 'package:agora_shop/controllers/CategoryProduct/category_product_controller.dart';
import 'package:agora_shop/providers/Home_providers.dart/get_category_product_provider.dart';
import 'package:get/get.dart';

class CategoryProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryProductController>(
      () => CategoryProductController(),
    );

    ////////////////////
    Get.lazyPut<GetCategoryProductProvider>(
        () => GetCategoryProductProvider(Get.find()));
  }
}
