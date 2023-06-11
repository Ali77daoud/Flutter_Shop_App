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

class MainController extends GetxController {
  final storage = GetStorage();
  int i = 0;
  String token = '';
  bool isMainCircleShown = false;

  AddOrDeleteFavProvider addOrDeleteFavProvider =
      Get.find<AddOrDeleteFavProvider>();

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

  Future<void> addOrDeleteFav({required int id, required String token}) async {
    showMainCircleIndicator();
    final failureOraddOrDeleteFav =
        await addOrDeleteFavProvider.call(token: token, id: id);
    failureOraddOrDeleteFav.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideMainCircleIndicator,
          showNoInternetPage: () {});
    }, (getFavData) {
      hideMainCircleIndicator();
      SnackBarWidgets.showSuccessSnackBar(getFavData, '');
    });
  }
}
