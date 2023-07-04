import 'package:agora_shop/controllers/Client/client_controller.dart';
import 'package:agora_shop/models/Address/addresses_data_model.dart';
import 'package:agora_shop/providers/Address_providers/get_address_data_provider.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  bool isGetAddressNoInternetConnection = false;
  bool isGetAddressCircleShown = false;
  bool isUpdateAddressNoInternetConnection = false;
  bool isUpdateAddressCircleShown = false;
  int currentIndex = 0;

  final HttpClientController clientController =
      Get.find<HttpClientController>();

  late AddressesDataModel addressData;

  GetAddressDataProvider getAddressDataProvider =
      Get.find<GetAddressDataProvider>();

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

/////////////////////////////
  void chooseAddress(int index) {
    currentIndex = index;
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    debugPrint('address Controller Init');
    await getAddressData(lang: lanLocal, token: token);
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

  // Future<void> updateProfile(
  //     {required UpdateProfileModel updateProfileModel,
  //     required String token,
  //     required String lang}) async {
  //   showUpdateProfileCircleIndicator();
  //   final failureOrUpdateProfile = await updateProfileProvider.call(
  //       updateProfileModel: updateProfileModel, token: token, lang: lang);
  //   failureOrUpdateProfile.fold((failure) {
  //     HandlingErrors.networkErrorrHandling(
  //         failure: failure,
  //         hideCircleIndicator: hideUpdateProfileCircleIndicator,
  //         showNoInternetPage: () {});
  //   }, (profileData) {
  //     hideUpdateProfileCircleIndicator();
  //     SnackBarWidgets.showSuccessSnackBar(profileData.message, '');
  //   });
  // }
}
