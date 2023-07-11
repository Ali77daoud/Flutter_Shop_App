import 'package:agora_shop/controllers/CheckOut/checkout_controller.dart';
import 'package:agora_shop/controllers/Client/client_controller.dart';
import 'package:agora_shop/providers/Checkout_providers/add_address_provider.dart';
import 'package:agora_shop/providers/Checkout_providers/add_order_provider.dart';
import 'package:agora_shop/providers/Checkout_providers/delete_address_provider.dart';
import 'package:agora_shop/providers/Checkout_providers/get_address_data_provider.dart';
import 'package:agora_shop/repositories/checkout_repository.dart';
import 'package:agora_shop/services/networking/checkout_api_service.dart';
import 'package:get/get.dart';

class CheckOutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckOutController>(() => CheckOutController());
    ////// profile /////////////////////////////////////
    Get.lazyPut<CheckOutApiService>(() => CheckOutApiServiceImpWithHttp(
        clientController: Get.find<HttpClientController>()));
    Get.lazyPut<CheckOutRepository>(() => CheckOutRepository(
        addressApiService: Get.find(), networkInfo: Get.find()));
    Get.lazyPut<GetAddressDataProvider>(
      () => GetAddressDataProvider(Get.find()),
    );

    Get.lazyPut<AddAddressProvider>(
      () => AddAddressProvider(Get.find()),
    );

    Get.lazyPut<DeleteAddressProvider>(
      () => DeleteAddressProvider(Get.find()),
    );

    Get.lazyPut<AddOrderProvider>(
      () => AddOrderProvider(Get.find()),
    );
  }
}
