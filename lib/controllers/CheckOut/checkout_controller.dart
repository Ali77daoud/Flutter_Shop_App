import 'package:agora_shop/controllers/Main/main_controller.dart';
import 'package:agora_shop/models/Address/addresses_data_model.dart';
import 'package:agora_shop/providers/Checkout_providers/add_address_provider.dart';
import 'package:agora_shop/providers/Checkout_providers/delete_address_provider.dart';
import 'package:agora_shop/providers/Checkout_providers/get_address_data_provider.dart';
import 'package:agora_shop/providers/Checkout_providers/add_order_provider.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../models/Address/add_address_model.dart';
import '../../shared/widgets/snackbar_widgets.dart';

class CheckOutController extends GetxController {
  bool isGetAddressNoInternetConnection = false;
  bool isGetAddressCircleShown = false;
  bool isAddAddressCircleShown = false;
  bool isDeleteAddressCircleShown = false;
  bool isAddOrderCircleShown = false;

  bool newAddressAdded = false;
  late int addressCurrentId;

  GetStorage addressIdBox = GetStorage();
  final MainController mainController = Get.find<MainController>();

  late AddressesDataModel addressData;

  GetAddressDataProvider getAddressDataProvider =
      Get.find<GetAddressDataProvider>();
  AddAddressProvider addAddressProvider = Get.find<AddAddressProvider>();
  DeleteAddressProvider deleteAddressProvider =
      Get.find<DeleteAddressProvider>();
  AddOrderProvider addOrderProvider = Get.find<AddOrderProvider>();

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

  ////////////////////////
  // ///////////////////////////
  void showAddOrderCircleIndicator() {
    isAddOrderCircleShown = true;
    update();
  }

  void hideAddOrderCircleIndicator() {
    isAddOrderCircleShown = false;
    update();
  }

// ///////////////////////////
  void showDeleteAddressCircleIndicator() {
    isDeleteAddressCircleShown = true;
    update();
  }

  void hideDeleteAddressCircleIndicator() {
    isDeleteAddressCircleShown = false;
    update();
  }

/////////////////////////////
  void chooseAddress(int id) async {
    addressCurrentId = id;
    await addressIdBox.write('addressId', id);
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    debugPrint('address Controller Init');
    await getAddressData(lang: lanLocal, token: token);
    addressCurrentId =
        addressIdBox.read<int>('addressId') ?? addressData.data.data[0].id;
  }

  @override
  void onClose() async {
    super.onClose();
    debugPrint('address Controller closed');
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
      {required AddAddress addAddress,
      required String token,
      required String lang}) async {
    showAddAddressCircleIndicator();
    final failureOrAddAddress = await addAddressProvider.call(
        addAddress: addAddress, token: token, lang: lang);
    failureOrAddAddress.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideAddAddressCircleIndicator,
          showNoInternetPage: () {});
    }, (addAddress) {
      hideAddAddressCircleIndicator();
      newAddressAdded = true;
      chooseAddress(addAddress.data.id);
      SnackBarWidgets.showSuccessSnackBar(addAddress.message, '');
    });
  }

  Future<void> deleteAddress(
      {required int id, required String token, required String lang}) async {
    showDeleteAddressCircleIndicator();
    final failureOrDeleteAddress =
        await deleteAddressProvider.call(id: id, token: token, lang: lang);
    failureOrDeleteAddress.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideDeleteAddressCircleIndicator,
          showNoInternetPage: () {});
    }, (message) {
      hideDeleteAddressCircleIndicator();
      addressData.data.data.removeWhere((element) => element.id == id);
      SnackBarWidgets.showSuccessSnackBar(message, '');
      update();
    });
  }

  ///////////////////////////////////
  Future<void> addOrder(
      {required String lang,
      required String token,
      required int addressId}) async {
    showAddOrderCircleIndicator();
    final failureOrAddOrder = await addOrderProvider.call(
        token: token, lang: lang, addressId: addressId);
    failureOrAddOrder.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideAddOrderCircleIndicator,
          showNoInternetPage: () {});
    }, (message) {
      hideAddOrderCircleIndicator();
      SnackBarWidgets.showSuccessSnackBar(message, '');
      Get.close(1);
      mainController.changeIndex(0);
    });
  }
}
