import 'package:agora_shop/controllers/Client/client_controller.dart';
import 'package:agora_shop/models/Auth/update_profile_model.dart';
import 'package:agora_shop/models/Auth/user_data_model.dart';
import 'package:agora_shop/providers/Profile_providers/get_user_data_provider.dart';
import 'package:agora_shop/providers/Profile_providers/update_profile_provider.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:agora_shop/shared/widgets/snackbar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  bool isGetProfileNoInternetConnection = false;
  bool isGetProfileCircleShown = false;
  bool isUpdateProfileNoInternetConnection = false;
  bool isUpdateProfileCircleShown = false;

  GetStorage storageBox = GetStorage();

  final HttpClientController clientController =
      Get.find<HttpClientController>();

  late UserDataModel userData;
  late UserModel profileData;

  GetUserDataProvider getUserDataProvider = Get.find<GetUserDataProvider>();
  UpdateProfileProvider updateProfileProvider =
      Get.find<UpdateProfileProvider>();

  // ///////////////////////////
  void showGetProfileCircleIndicator() {
    isGetProfileCircleShown = true;
    update();
  }

  void hideGetProfileCircleIndicator() {
    isGetProfileCircleShown = false;
    update();
  }

///////////////////////////////////
  void showGetProfileNoInternetPage() {
    isGetProfileNoInternetConnection = true;
    update();
  }

  void hideGetProfileNoInternetPage() {
    isGetProfileNoInternetConnection = false;
    update();
  }
/////////////////////////////

  // ///////////////////////////
  void showUpdateProfileCircleIndicator() {
    isUpdateProfileCircleShown = true;
    update();
  }

  void hideUpdateProfileCircleIndicator() {
    isUpdateProfileCircleShown = false;
    update();
  }

///////////////////////////////////
  void showUpdateProfileNoInternetPage() {
    isUpdateProfileNoInternetConnection = true;
    update();
  }

  void hideUpdateProfileNoInternetPage() {
    isUpdateProfileNoInternetConnection = false;
    update();
  }
/////////////////////////////

  @override
  void onInit() async {
    super.onInit();
    debugPrint('Profile Controller Init');
    await getUserData(lang: 'en', token: token!);
  }

  @override
  void onClose() async {
    super.onClose();
    debugPrint('Profile Controller closed');
    await clientController.closeClient().then((value) async {
      await clientController.reOpenClient();
    });
  }

  ///////////////////////////////////
  Future<void> getUserData(
      {required String lang, required String token}) async {
    showGetProfileCircleIndicator();
    final failureOrGetUserData =
        await getUserDataProvider.call(token: token, lang: lang);
    failureOrGetUserData.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideGetProfileCircleIndicator,
          showNoInternetPage: showGetProfileNoInternetPage);
    }, (getuserData) {
      userData = getuserData;
      Future.wait([
        storageBox.write('name', userData.name),
        storageBox.write('email', userData.email),
      ]);
      hideGetProfileCircleIndicator();
      hideGetProfileNoInternetPage();
    });
  }

  ///////////

  Future<void> updateProfile(
      {required UpdateProfileModel updateProfileModel,
      required String token,
      required String lang}) async {
    showUpdateProfileCircleIndicator();
    final failureOrUpdateProfile = await updateProfileProvider.call(
        updateProfileModel: updateProfileModel, token: token, lang: lang);
    failureOrUpdateProfile.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideUpdateProfileCircleIndicator,
          showNoInternetPage: () {});
    }, (profileData) {
      hideUpdateProfileCircleIndicator();
      SnackBarWidgets.showSuccessSnackBar(profileData.message, '');
    });
  }
}
