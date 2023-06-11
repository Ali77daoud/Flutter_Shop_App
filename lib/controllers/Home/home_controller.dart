import 'package:agora_shop/controllers/Client/client_controller.dart';
import 'package:agora_shop/models/HomeData/category_data_model.dart';
import 'package:agora_shop/providers/Home_providers.dart/get_category_data_provider.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/HomeData/home_data_model.dart';
import '../../providers/Home_providers.dart/get_home_data_provider.dart';

class HomeController extends GetxController {
  bool isHomeNoInternetConnection = false;
  bool isHomeCircleShown = false;
  bool isProductNoInternetConnection = false;
  bool isProductCircleShown = false;

  int currentBanner = 0;

  final HttpClientController clientController =
      Get.find<HttpClientController>();

  late CarouselController carouselController;

  late HomeDataModel homeData;
  late CategoryDataModel categoryData;

  GetHomeDataProvider getHomeDataProvider = Get.find<GetHomeDataProvider>();
  GetCategoryDataProvider getCategoryDataProvider =
      Get.find<GetCategoryDataProvider>();

  // ///////////////////////////
  void showHomeCircleIndicator() {
    isHomeCircleShown = true;
    update();
  }

  void hideHomeCircleIndicator() {
    isHomeCircleShown = false;
    update();
  }

  ////////////////////////////////////////////////////
  void showHomeNoInternetPage() {
    isHomeNoInternetConnection = true;
    update();
  }

  void hideHomeNoInternetPage() {
    isHomeNoInternetConnection = false;
    update();
  }

  //////////////////////
  // ///////////////////////////
  void showProductCircleIndicator() {
    isProductCircleShown = true;
    update();
  }

  void hideProductCircleIndicator() {
    isProductCircleShown = false;
    update();
  }

  ////////////////////////////////////////////////////
  void showProductNoInternetPage() {
    isProductNoInternetConnection = true;
    update();
  }

  void hideProductNoInternetPage() {
    isProductNoInternetConnection = false;
    update();
  }

  void changeBanner(int index) {
    currentBanner = index;
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    debugPrint('Home Controller Init');
    debugPrint(token);
    carouselController = CarouselController();
    await getHomeData(lang: 'en', token: token!).then((value) async {
      await getCategoryData(lang: 'en', token: token!);
    });
  }

  @override
  void onClose() async {
    super.onClose();
    debugPrint('Home Controller closed');
    await clientController.closeClient().then((value) async {
      await clientController.reOpenClient();
    });
  }

  Future<void> getHomeData(
      {required String lang, required String token}) async {
    showHomeCircleIndicator();
    final failureOrGetHomeData =
        await getHomeDataProvider.call(token: token, lang: lang);
    failureOrGetHomeData.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideHomeCircleIndicator,
          showNoInternetPage: showHomeNoInternetPage);
    }, (getHomeData) {
      homeData = getHomeData;
      hideHomeCircleIndicator();
      hideHomeNoInternetPage();
    });
  }

  Future<void> getCategoryData(
      {required String lang, required String token}) async {
    showHomeCircleIndicator();
    final failureOrGetCategoryData =
        await getCategoryDataProvider.call(token: token, lang: lang);
    failureOrGetCategoryData.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideHomeCircleIndicator,
          showNoInternetPage: showHomeNoInternetPage);
    }, (getcategoryData) {
      categoryData = getcategoryData;
      hideHomeCircleIndicator();
      hideHomeNoInternetPage();
    });
  }
}
