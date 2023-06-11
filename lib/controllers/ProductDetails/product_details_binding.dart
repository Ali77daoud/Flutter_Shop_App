import 'package:agora_shop/providers/Home_providers.dart/get_product_details.dart';
import 'package:get/get.dart';
import 'product_details_controller.dart';

class ProductDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsController>(
      () => ProductDetailsController(),
    );

    ///
    Get.lazyPut<GetProductDetailsProvider>(
        () => GetProductDetailsProvider(Get.find()));
  }
}
