import 'package:agora_shop/providers/Cart_providers/add_or_remove_cart_provider.dart';
import 'package:agora_shop/providers/Fav_providers/add_or_delete_fav_provider.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:agora_shop/shared/widgets/snackbar_widgets.dart';
import 'package:agora_shop/views/Cart/cart_page.dart';
import 'package:agora_shop/views/Favourite/favourite_page.dart';
import 'package:agora_shop/views/Home/home_page.dart';
import 'package:agora_shop/views/Profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../providers/Cart_providers/delete_cart_provider.dart';
import '../../providers/Cart_providers/update_cart_provider.dart';

class MainController extends GetxController {
  final storage = GetStorage();
  int i = 0;
  String token = '';
  bool isMainCircleShown = false;

  AddOrDeleteFavProvider addOrDeleteFavProvider =
      Get.find<AddOrDeleteFavProvider>();
  AddOrRemoveCartProvider addOrRemoveCartProvider =
      Get.find<AddOrRemoveCartProvider>();
  UpdateCartProvider updateCartProvider = Get.find<UpdateCartProvider>();
  DeleteCartProvider deleteCartProvider = Get.find<DeleteCartProvider>();

  void changeIndex(int index) {
    i = index;
    update();
  }

  List<Widget> screens = [
    const HomePage(),
    const CartPage(),
    const FavouritePage(),
    ProfilePage()
  ];

  // ///////////////////////////
  void showMainCircleIndicator() {
    isMainCircleShown = true;
    update();
  }

  void hideMainCircleIndicator() {
    isMainCircleShown = false;
    update();
  }

  Future<void> addOrDeleteFav(
      {required int id, required String lang, required String token}) async {
    showMainCircleIndicator();
    final failureOraddOrDeleteFav =
        await addOrDeleteFavProvider.call(token: token, lang: lang, id: id);
    failureOraddOrDeleteFav.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideMainCircleIndicator,
          showNoInternetPage: () {});
    }, (message) {
      hideMainCircleIndicator();
      SnackBarWidgets.showSuccessSnackBar(message, '');
    });
  }

  Future<void> addOrRemoveCart(
      {required int id, required String lang, required String token}) async {
    showMainCircleIndicator();
    final failureOraddOrRemoveCart =
        await addOrRemoveCartProvider.call(token: token, lang: lang, id: id);
    failureOraddOrRemoveCart.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideMainCircleIndicator,
          showNoInternetPage: () {});
    }, (message) {
      hideMainCircleIndicator();
      SnackBarWidgets.showSuccessSnackBar(message, '');
    });
  }

  Future<void> updateCart(
      {required int id,
      required String lang,
      required String token,
      required int quantity}) async {
    showMainCircleIndicator();
    final failureOrUpdateCart = await updateCartProvider.call(
        token: token, lang: lang, id: id, quantity: quantity);
    failureOrUpdateCart.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideMainCircleIndicator,
          showNoInternetPage: () {});
    }, (message) {
      hideMainCircleIndicator();
      SnackBarWidgets.showSuccessSnackBar(message, '');
    });
  }

  Future<void> deleteCart({
    required int id,
    required String lang,
    required String token,
  }) async {
    showMainCircleIndicator();
    final failureOrDeleteCart =
        await deleteCartProvider.call(token: token, lang: lang, id: id);
    failureOrDeleteCart.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideMainCircleIndicator,
          showNoInternetPage: () {});
    }, (message) {
      hideMainCircleIndicator();
      SnackBarWidgets.showSuccessSnackBar(message, '');
    });
  }
}
