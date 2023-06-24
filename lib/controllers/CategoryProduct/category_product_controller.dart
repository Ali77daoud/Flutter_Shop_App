import 'package:agora_shop/controllers/Client/client_controller.dart';
import 'package:agora_shop/models/HomeData/category_product_model.dart';
import 'package:agora_shop/providers/Home_providers.dart/get_category_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/handling_errors.dart/handling_errors.dart';
import '../../shared/shared_variables.dart';

class CategoryProductController extends GetxController {
  bool isCategoryProductNoInternetConnection = false;
  bool isCategoryProductCircleShown = false;

  final HttpClientController clientController =
      Get.find<HttpClientController>();

  late CategoryProductModel categoryProductData;

  GetCategoryProductProvider getCategoryProductProvider =
      Get.find<GetCategoryProductProvider>();

  // ///////////////////////////
  void showCategoryProductCircleIndicator() {
    isCategoryProductCircleShown = true;
    update();
  }

  void hideCategoryProductCircleIndicator() {
    isCategoryProductCircleShown = false;
    update();
  }

  ////////////////////////////////////////////////////
  void showCategoryProductNoInternetPage() {
    isCategoryProductNoInternetConnection = true;
    update();
  }

  void hideCategoryProductNoInternetPage() {
    isCategoryProductNoInternetConnection = false;
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    debugPrint('Category Product Controller Init');
    final int categoryId = Get.arguments['CategoryId'];
    await getCategoryProduct(lang: 'en', token: token!, categoryId: categoryId);
  }

  @override
  void onClose() async {
    super.onClose();
    debugPrint('Product Details Controller closed');
  }

  //////////////////////
  Future<void> getCategoryProduct(
      {required String lang,
      required String token,
      required int categoryId}) async {
    showCategoryProductCircleIndicator();
    final failureOrProductDetails = await getCategoryProductProvider.call(
        token: token, lang: lang, categoryId: categoryId);
    failureOrProductDetails.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideCategoryProductCircleIndicator,
          showNoInternetPage: showCategoryProductNoInternetPage);
    }, (categoryProduct) {
      categoryProductData = categoryProduct;
      hideCategoryProductCircleIndicator();
      hideCategoryProductNoInternetPage();
    });
  }
}
