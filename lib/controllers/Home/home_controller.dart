import 'package:agora_shop/controllers/Client/client_controller.dart';
import 'package:agora_shop/models/HomeData/category_data_model.dart';
import 'package:agora_shop/models/HomeData/product_details_model.dart';
import 'package:agora_shop/providers/Home_providers.dart/get_category_data_provider.dart';
import 'package:agora_shop/providers/Home_providers.dart/get_product_details.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/HomeData/home_data_model.dart';
import '../../providers/Home_providers.dart/get_home_data_provider.dart';

class HomeController extends GetxController {
  bool isNoInternetConnection = false;
  bool isCircleShown = false;
  int currentBanner = 0;

  final HttpClientController clientController =
      Get.find<HttpClientController>();

  late CarouselController carouselController;

  late HomeDataModel homeData;
  late CategoryDataModel categoryData;
  late ProductDetailsModel productDetailsData;

  GetHomeDataProvider getHomeDataProvider = Get.find<GetHomeDataProvider>();
  GetCategoryDataProvider getCategoryDataProvider =
      Get.find<GetCategoryDataProvider>();
  GetProductDetailsProvider getProductDetailsProvider =
      Get.find<GetProductDetailsProvider>();
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
    print(token);
    carouselController = CarouselController();
    await getHomeData(lang: 'en', token: token!).then((value) async {
      await getCategoryData(lang: 'en', token: token!);
    });
  }

  @override
  void onClose() {
    super.onClose();
    debugPrint('Home Controller closed');
    clientController.closeClient();
    clientController.reOpenClient();
  }

  Future<void> getHomeData(
      {required String lang, required String token}) async {
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

  Future<void> getCategoryData(
      {required String lang, required String token}) async {
    showCircleIndicator();
    final failureOrGetCategoryData =
        await getCategoryDataProvider.call(token: token, lang: lang);
    failureOrGetCategoryData.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideCircleIndicator,
          showNoInternetPage: showNoInternetPage);
    }, (getcategoryData) {
      categoryData = getcategoryData;
      hideCircleIndicator();
      hideNoInternetPage();
    });
  }

  Future<void> getProductDetails(
      {required String lang, required String token, required int id}) async {
    showCircleIndicator();
    final failureOrProductDetails =
        await getProductDetailsProvider.call(token: token, lang: lang, id: id);
    failureOrProductDetails.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideCircleIndicator,
          showNoInternetPage: showNoInternetPage);
    }, (productDetails) {
      productDetailsData = productDetails;
      hideCircleIndicator();
      hideNoInternetPage();
    });
  }
}
