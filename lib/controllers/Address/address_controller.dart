import 'package:agora_shop/controllers/Client/client_controller.dart';
import 'package:agora_shop/models/Address/addresses_data_model.dart';
import 'package:agora_shop/providers/Address_providers/add_address_provider.dart';
import 'package:agora_shop/providers/Address_providers/get_address_data_provider.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/Address/add_address_model.dart';
import '../../shared/widgets/snackbar_widgets.dart';

class AddressController extends GetxController {
  bool isGetAddressNoInternetConnection = false;
  bool isGetAddressCircleShown = false;
  bool isAddAddressCircleShown = false;
  bool newAddressAdded = false;
  late int currentId;

  GetStorage addressIdBox = GetStorage();

  final HttpClientController clientController =
      Get.find<HttpClientController>();

  late AddressesDataModel addressData;

  GetAddressDataProvider getAddressDataProvider =
      Get.find<GetAddressDataProvider>();
  AddAddressProvider addAddressProvider = Get.find<AddAddressProvider>();

  // ///////////////////////////
  void showGetAddressCircleIndicator() {
    isGetAddressCircleShown = true;
    update();
  }

  void hideGetAddressCircleIndicator() {
    isGetAddressCircleShown = false;
    update();
  }

///////////////////////////////////
  void showGetAddressNoInternetPage() {
    isGetAddressNoInternetConnection = true;
    update();
  }

  void hideGetAddressNoInternetPage() {
    isGetAddressNoInternetConnection = false;
    update();
  }

  // ///////////////////////////
  void showAddAddressCircleIndicator() {
    isAddAddressCircleShown = true;
    update();
  }

  void hideAddAddressCircleIndicator() {
    isAddAddressCircleShown = false;
    update();
  }

/////////////////////////////
  void chooseAddress(int id) async {
    currentId = id;
    await addressIdBox.write('addressId', id);
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    debugPrint('address Controller Init');
    await getAddressData(lang: lanLocal, token: token);
    currentId =
        addressIdBox.read<int>('addressId') ?? addressData.data.data[0].id;
  }

  @override
  void onClose() async {
    super.onClose();
    debugPrint('address Controller closed');
    await clientController.closeClient().then((value) async {
      await clientController.reOpenClient();
    });
  }

  ///////////////////////////////////
  Future<void> getAddressData(
      {required String lang, required String token}) async {
    showGetAddressCircleIndicator();
    final failureOrGetAddressData =
        await getAddressDataProvider.call(token: token, lang: lang);
    failureOrGetAddressData.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideGetAddressCircleIndicator,
          showNoInternetPage: showGetAddressNoInternetPage);
    }, (getAddressesData) {
      addressData = getAddressesData;
      hideGetAddressCircleIndicator();
      hideGetAddressNoInternetPage();
    });
  }

  // ///////////

  Future<void> addAddress(
      {required AddressData addressData,
      required String token,
      required String lang}) async {
    showAddAddressCircleIndicator();
    final failureOrAddAddress = await addAddressProvider.call(
        addressData: addressData, token: token, lang: lang);
    failureOrAddAddress.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideAddAddressCircleIndicator,
          showNoInternetPage: () {});
    }, (addAddress) {
      hideAddAddressCircleIndicator();
      newAddressAdded = true;
      SnackBarWidgets.showSuccessSnackBar(addAddress.message, '');
    });
  }
}
