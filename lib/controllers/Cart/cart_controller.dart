import 'package:agora_shop/models/Cart/cart_data_model.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../providers/Cart_providers/get_cart_data_provider.dart';

class CartController extends GetxController {
  bool isCartNoInternetConnection = false;
  bool isCartCircleShown = false;

  late CartDataModel cartData;

  GetCartDataProvider getCartDataProvider = Get.find<GetCartDataProvider>();

  // ///////////////////////////
  void showCartCircleIndicator() {
    isCartCircleShown = true;
    update();
  }

  void hideCartCircleIndicator() {
    isCartCircleShown = false;
    update();
  }

///////////////////////////////////
  void showCartNoInternetPage() {
    isCartNoInternetConnection = true;
    update();
  }

  void hideCartNoInternetPage() {
    isCartNoInternetConnection = false;
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    debugPrint('Cart Controller Init');
    await getCartData(lang: lanLocal, token: token);
  }

  @override
  void onClose() async {
    super.onClose();
    debugPrint('Cart Controller closed');
  }

  Future<void> getCartData(
      {required String lang, required String token}) async {
    showCartCircleIndicator();
    final failureOrGetCartData =
        await getCartDataProvider.call(token: token, lang: lang);
    failureOrGetCartData.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideCartCircleIndicator,
          showNoInternetPage: showCartNoInternetPage);
    }, (getCartData) {
      cartData = getCartData;
      hideCartCircleIndicator();
      hideCartNoInternetPage();
    });
  }
}
