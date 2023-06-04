import 'package:agora_shop/controllers/Main/main_controller.dart';
import 'package:agora_shop/repositories/home_repository.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/HomeData/home_data_model.dart';
import '../../providers/Home_providers.dart/get_home_data_provider.dart';
import '../../services/networking/home_api_service.dart';

class HomeController extends GetxController {
  final storage = GetStorage();
  String token = '';
  bool isNoInternetConnection = false;
  bool isCircleShown = false;
  int currentBanner = 0;

  // final MainController mainController = Get.find<MainController>();
  late CarouselController carouselController;

  late HomeDataModel homeData;
  late GetHomeDataProvider getHomeDataProvider = Get.find();

  // ///////////////////////////
  void showCircleIndicator() {
    isCircleShown = true;
    update();
  }

  void hideCircleIndicator() {
    isCircleShown = false;
    update();
  }

  ////////////////////////////////////////////////////
  void showNoInternetPage() {
    isNoInternetConnection = true;
    update();
  }

  void hideNoInternetPage() {
    isNoInternetConnection = false;
    update();
  }
  //////////////////////

  void changeBanner(int index) {
    currentBanner = index;
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    debugPrint('Home Controller Init');
    if (storage.read('token') != null) {
      token = storage.read('token');
      debugPrint('token not null');
    }
    carouselController = CarouselController();
    await getHomeData(lang: 'en');
  }

  @override
  void onClose() {
    super.onClose();
    debugPrint('Home Controller closed');
  }

  Future<void> getHomeData({required String lang}) async {
    showCircleIndicator();
    final failureOrGetHomeData =
        await getHomeDataProvider.call(token: token, lang: lang);
    failureOrGetHomeData.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideCircleIndicator,
          showNoInternetPage: showNoInternetPage);
    }, (getHomeData) {
      homeData = getHomeData;
      hideCircleIndicator();
      hideNoInternetPage();
    });
  }
}
