import 'package:agora_shop/controllers/OrderDetails.dart/order_details_controller.dart';
import 'package:agora_shop/providers/Orders_providers.dart/get_order_details_data_provider.dart';
import 'package:get/get.dart';

class OrderDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailsController>(() => OrderDetailsController());
    ////// profile /////////////////////////////////////

    Get.lazyPut<GetOrderDetailsDataProvider>(
      () => GetOrderDetailsDataProvider(Get.find()),
    );
  }
}
