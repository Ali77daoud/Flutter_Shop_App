import 'package:agora_shop/models/Auth/login_model.dart';
import 'package:agora_shop/models/Auth/register_model.dart';
import 'package:agora_shop/models/Auth/user_data_model.dart';
import 'package:agora_shop/providers/Auth_providers/login_provider.dart';
import 'package:agora_shop/providers/Auth_providers/register_provider.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../routes/routes.dart';
import '../../shared/constants/lang_constants.dart';
import '../../shared/shared_variables.dart';
import '../../shared/widgets/snackbar_widgets.dart';

class AuthController extends GetxController {
  bool isCircleShown = false;
  bool isNoInternetConnection = false;
  bool isLogin = false;
  bool isObscure = true;

  GetStorage storageBox = GetStorage();

  late LoginProvider loginProvider = Get.find();
  late RegisterProvider registerProvider = Get.find();

  late UserDataModel userData;

  ///////////////////
  void changeIsObscure() {
    isObscure = !isObscure;
    update();
  }

/////////////////////////
  void showCircleIndicator() {
    isCircleShown = true;
    update();
  }

////////////////////////////
  void hideCircleIndicator() {
    isCircleShown = false;
    update();
  }

///////////////////////////////////
  void showNoInternetPage() {
    isNoInternetConnection = true;
    update();
  }

  void hideNoInternetPage() {
    isNoInternetConnection = false;
    update();
  }
/////////////////////////////

  Future<void> login({required LoginModel loginModel}) async {
    showCircleIndicator();
    final failureOrLogin = await loginProvider.call(loginModel);
    failureOrLogin.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideCircleIndicator,
          showNoInternetPage: () {});
    }, (getUserData) async {
      userData = getUserData;
      isLogin = true;
      token = userData.token;
      Future.wait([
        storageBox.write('token', userData.token),
        storageBox.write('isLogin', isLogin),
        storageBox.write('name', userData.name),
        storageBox.write('email', userData.email),
      ]);
      hideCircleIndicator();
      Get.offAllNamed(Routes.mainPage);
      SnackBarWidgets.showSuccessSnackBar('Login Succeeded', '');
    });
  }

  ///////////////////
  Future<void> register({required RegisterModel registerModel}) async {
    showCircleIndicator();
    final failureOrLogin = await registerProvider.call(registerModel);
    failureOrLogin.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideCircleIndicator,
          showNoInternetPage: () {});
    }, (getUserData) async {
      userData = getUserData;
      isLogin = true;
      token = userData.token;
      Future.wait([
        storageBox.write('token', userData.token),
        storageBox.write('isLogin', isLogin),
        storageBox.write('name', userData.name),
        storageBox.write('email', userData.email),
      ]);
      hideCircleIndicator();
      Get.offAllNamed(Routes.mainPage);
      SnackBarWidgets.showSuccessSnackBar('SignUp Succeeded', '');
    });
  }

  //////////////////
  Future<void> logOut() async {
    isLogin = false;
    Future.wait(
        [storageBox.remove('token'), storageBox.write('isLogin', isLogin)]);
    Get.offAllNamed(Routes.welcomePage);
  }

  //for setting language
  var lanBox = GetStorage();

  void changeLanguage(String lang) async {
    if (lanLocal == lang) {
      return;
    }
    if (lang == ara) {
      lanLocal = ara;
      saveLanguage(ara);
    } else {
      lanLocal = ene;
      saveLanguage(ene);
    }
    await Get.updateLocale(Locale(lang));
    update();
  }

  void saveLanguage(String lang) async {
    await lanBox.write('lang', lang);
  }
}
