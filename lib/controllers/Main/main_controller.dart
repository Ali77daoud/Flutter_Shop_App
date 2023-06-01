import 'package:agora_shop/providers/Home_providers.dart/get_home_data_provider.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:agora_shop/views/Cart/cart_page.dart';
import 'package:agora_shop/views/Favourite/favourite_page.dart';
import 'package:agora_shop/views/Profile/profile_page.dart';
import 'package:agora_shop/views/home/home_page.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../models/HomeData/home_data_model.dart';

class MainController extends GetxController {
  final storage = GetStorage();
  bool isNoInternetConnection = false;
  bool isCircleShown = false;
  int i = 0;
  int currentBanner = 0;
  String token = '';

  late HomeDataModel homeData;

  late CarouselController carouselController;
  late GetHomeDataProvider getHomeDataProvider = Get.find();

  void changeBanner(int index) {
    currentBanner = index;
    update();
  }

  void changeIndex(int index) {
    i = index;
    update();
  }

  // ///////////////////////////
  void showCircleIndicator() {
    isCircleShown = true;
    update();
  }

  void hideCircleIndicator() {
    isCircleShown = false;
    update();
  }

  // /////////////////////////
  // ///////////////////////////////////////////////////
  void showNoInternetPage() {
    isNoInternetConnection = true;
    update();
  }

  void hideNoInternetPage() {
    isNoInternetConnection = false;
    update();
  }

  // void errorHandling(Failure failure) {
  //   switch (failure.runtimeType) {
  //     case ServerFailure:
  //       hideCircleIndicator();
  //       showNoInternetPage();
  //       SnackBarWidgets.showFailureSnackBar(
  //           'Server Error', serverFailureMessage);
  //       break;
  //     case OfflineFailure:
  //       hideCircleIndicator();
  //       showNoInternetPage();
  //       SnackBarWidgets.showFailureSnackBar(
  //           'No Connection', offlineFailureMessage);
  //       break;
  //     default:
  //       hideCircleIndicator();
  //       showNoInternetPage();
  //       SnackBarWidgets.showFailureSnackBar(
  //           'Unexpected error', unExpectedFailureMessage);
  //       break;
  //   }
  // }

  List<Widget> screens = [
    HomePage(),
    CartPage(),
    FavouritePage(),
    ProfilePage()
  ];

  @override
  void onInit() async {
    super.onInit();
    if (storage.read('token') != null) {
      token = storage.read('token');
      debugPrint('token not null');
    }
    carouselController = CarouselController();
  }

  Future<void> getHomeData({required String lang}) async {
    showCircleIndicator();
    final failureOrGetOffers =
        await getHomeDataProvider.call(token: token, lang: lang);
    failureOrGetOffers.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideCircleIndicator,
          showNoInternetPage: showNoInternetPage);
    }, (getHomeData) {
      getHomeData = homeData;
      hideCircleIndicator();
      hideNoInternetPage();
    });
  }
}
