import 'package:agora_shop/models/ProductDetails/product_details_model.dart';
import 'package:agora_shop/providers/Home_providers.dart/get_product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/handling_errors.dart/handling_errors.dart';
import '../../shared/shared_variables.dart';

class ProductDetailsController extends GetxController {
  bool isProductNoInternetConnection = false;
  bool isProductCircleShown = false;

  late ProductDetailsModel productDetailsData;

  GetProductDetailsProvider getProductDetailsProvider =
      Get.find<GetProductDetailsProvider>();

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

  //////////////////////////////
  void showOrHideProductDetIsFav(bool y) {
    productDetailsData.data.inFavorites = y;
    update();
  }

//////////////////////////////
  void showOrHideProductDetIsCart(bool y) {
    productDetailsData.data.inCart = y;
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    debugPrint('Product Details Controller Init');
    final int productId = Get.arguments['ProductId'];
    await getProductDetails(lang: lanLocal, token: token, id: productId);
  }

  @override
  void onClose() async {
    super.onClose();
    debugPrint('Product Details Controller closed');
  }

  //////////////////////
  Future<void> getProductDetails(
      {required String lang, required String token, required int id}) async {
    showProductCircleIndicator();
    final failureOrProductDetails =
        await getProductDetailsProvider.call(token: token, lang: lang, id: id);
    failureOrProductDetails.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideProductCircleIndicator,
          showNoInternetPage: showProductNoInternetPage);
    }, (productDetails) {
      productDetailsData = productDetails;
      hideProductCircleIndicator();
      hideProductNoInternetPage();
    });
  }
}
