import 'package:agora_shop/models/Orders/order_details_model.dart';
import 'package:agora_shop/providers/Orders_providers.dart/get_order_details_data_provider.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  bool isGetOrderDetailsNoInternetConnection = false;
  bool isGetOrderDetailsCircleShown = false;

  late GetOrderDetailsModel orderDetailsData;

  GetOrderDetailsDataProvider getOrderDetailsDataProvider =
      Get.find<GetOrderDetailsDataProvider>();

  // ///////////////////////////
  void showGetOrderDetailsCircleIndicator() {
    isGetOrderDetailsCircleShown = true;
    update();
  }

  void hideGetOrderDetailsCircleIndicator() {
    isGetOrderDetailsCircleShown = false;
    update();
  }

///////////////////////////////////
  void showGetOrderDetailsNoInternetPage() {
    isGetOrderDetailsNoInternetConnection = true;
    update();
  }

  void hideGetOrderDetailsNoInternetPage() {
    isGetOrderDetailsNoInternetConnection = false;
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    debugPrint('Order Details Controller Init');
    await getOrderDetailsData(
        lang: lanLocal, token: token, orderId: Get.arguments['orderId']);
  }

  @override
  void onClose() async {
    super.onClose();
    debugPrint('Order Details Controller closed');
  }

  ///////////////////////////////////
  Future<void> getOrderDetailsData(
      {required String lang,
      required String token,
      required int orderId}) async {
    showGetOrderDetailsCircleIndicator();
    final failureOrGetOrderDetailsData = await getOrderDetailsDataProvider.call(
        token: token, lang: lang, orderId: orderId);
    failureOrGetOrderDetailsData.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideGetOrderDetailsCircleIndicator,
          showNoInternetPage: showGetOrderDetailsNoInternetPage);
    }, (getOrderDetailsData) {
      orderDetailsData = getOrderDetailsData;
      hideGetOrderDetailsCircleIndicator();
      hideGetOrderDetailsNoInternetPage();
    });
  }
}
