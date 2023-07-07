import 'package:agora_shop/controllers/Orders/orders_controller.dart';
import 'package:agora_shop/providers/Orders_providers.dart/get_address_data_provider.dart';
import 'package:agora_shop/repositories/order_repository.dart';
import 'package:agora_shop/services/networking/order_api_service.dart';
import 'package:get/get.dart';
import '../Client/client_controller.dart';

class OrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersController>(() => OrdersController());
    ////// profile /////////////////////////////////////
    Get.lazyPut<OrdersApiService>(() => OrdersApiServiceImpWithHttp(
        clientController: Get.find<HttpClientController>()));
    Get.lazyPut<OrdersRepository>(() => OrdersRepository(
        ordersApiService: Get.find(), networkInfo: Get.find()));
    Get.lazyPut<GetOrdersDataProvider>(
      () => GetOrdersDataProvider(Get.find()),
    );
  }
}
