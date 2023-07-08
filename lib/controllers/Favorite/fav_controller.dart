import 'package:agora_shop/models/Favorite/fav_data_model.dart';
import 'package:agora_shop/providers/Fav_providers/get_fav_data_provider.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavController extends GetxController {
  bool isFavNoInternetConnection = false;
  bool isFavCircleShown = false;

  late FavDataModel favData;

  GetFavDataProvider getFavDataProvider = Get.find<GetFavDataProvider>();

  // ///////////////////////////
  void showFavCircleIndicator() {
    isFavCircleShown = true;
    update();
  }

  void hideFavCircleIndicator() {
    isFavCircleShown = false;
    update();
  }

///////////////////////////////////
  void showFavNoInternetPage() {
    isFavNoInternetConnection = true;
    update();
  }

  void hideFavNoInternetPage() {
    isFavNoInternetConnection = false;
    update();
  }

/////////////////////////////

  @override
  void onInit() async {
    super.onInit();
    debugPrint('Fav Controller Init');
    await getFavData(lang: lanLocal, token: token);
  }

  @override
  void onClose() async {
    super.onClose();
    debugPrint('Fav Controller closed');
  }

  Future<void> getFavData({required String lang, required String token}) async {
    showFavCircleIndicator();
    final failureOrGetFavData =
        await getFavDataProvider.call(token: token, lang: lang);
    failureOrGetFavData.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideFavCircleIndicator,
          showNoInternetPage: showFavNoInternetPage);
    }, (getFavData) {
      favData = getFavData;
      hideFavCircleIndicator();
      hideFavNoInternetPage();
    });
  }
}
