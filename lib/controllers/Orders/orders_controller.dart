import 'package:agora_shop/models/Orders/get_order_model.dart';
import 'package:agora_shop/providers/Orders_providers.dart/cancel_order_provider.dart';
import 'package:agora_shop/providers/Orders_providers.dart/get_address_data_provider.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  bool isGetOrdersNoInternetConnection = false;
  bool isGetOrdersCircleShown = false;

  late OrderModel ordersData;

  GetOrdersDataProvider getOrdersDataProvider =
      Get.find<GetOrdersDataProvider>();

  CancelOrderProvider cancelOrderProvider = Get.find<CancelOrderProvider>();

  // ///////////////////////////
  void showGetOrdersCircleIndicator() {
    isGetOrdersCircleShown = true;
    update();
  }

  void hideGetOrdersCircleIndicator() {
    isGetOrdersCircleShown = false;
    update();
  }

///////////////////////////////////
  void showGetOrdersNoInternetPage() {
    isGetOrdersNoInternetConnection = true;
    update();
  }

  void hideGetOrdersNoInternetPage() {
    isGetOrdersNoInternetConnection = false;
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    debugPrint('Order Controller Init');
    await getOrdersData(lang: lanLocal, token: token);
  }

  @override
  void onClose() async {
    super.onClose();
    debugPrint('Order Controller closed');
  }

  ///////////////////////////////////
  Future<void> getOrdersData(
      {required String lang, required String token}) async {
    showGetOrdersCircleIndicator();
    final failureOrGetOrdersData =
        await getOrdersDataProvider.call(token: token, lang: lang);
    failureOrGetOrdersData.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideGetOrdersCircleIndicator,
          showNoInternetPage: showGetOrdersNoInternetPage);
    }, (getOrdersData) {
      ordersData = getOrdersData;
      hideGetOrdersCircleIndicator();
      hideGetOrdersNoInternetPage();
    });
  }

  // ///////////////////////////////////
  // Future<void> addOrder(
  //     {required String lang,
  //     required String token,
  //     required int addressId}) async {
  //   showAddOrderCircleIndicator();
  //   final failureOrAddOrder = await addOrderProvider.call(
  //       token: token, lang: lang, addressId: addressId);
  //   failureOrAddOrder.fold((failure) {
  //     HandlingErrors.networkErrorrHandling(
  //         failure: failure,
  //         hideCircleIndicator: hideAddOrderCircleIndicator,
  //         showNoInternetPage: () {});
  //   }, (message) {
  //     hideAddOrderCircleIndicator();
  //     SnackBarWidgets.showSuccessSnackBar(message, '');
  //     Get.offAllNamed(Routes.mainPage);
  //   });
  // }
}
