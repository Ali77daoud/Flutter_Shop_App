import 'package:agora_shop/controllers/Address/address_controller.dart';
import 'package:agora_shop/controllers/Client/client_controller.dart';
import 'package:agora_shop/providers/Address_providers/add_address_provider.dart';
import 'package:agora_shop/providers/Address_providers/get_address_data_provider.dart';
import 'package:agora_shop/repositories/address_repository.dart';
import 'package:get/get.dart';

import '../../services/networking/address_api_service.dart';

class AddressBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressController>(() => AddressController());
    ////// profile /////////////////////////////////////
    Get.lazyPut<AddressApiService>(() => AddressApiServiceImpWithHttp(
        clientController: Get.find<HttpClientController>()));
    Get.lazyPut<AddressRepository>(() => AddressRepository(
        addressApiService: Get.find(), networkInfo: Get.find()));
    Get.lazyPut<GetAddressDataProvider>(
      () => GetAddressDataProvider(Get.find()),
    );

    Get.lazyPut<AddAddressProvider>(
      () => AddAddressProvider(Get.find()),
    );
  }
}
