import 'package:agora_shop/controllers/Favorite/fav_controller.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:agora_shop/views/Favorite/components/fav_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavController>(
      init: FavController(),
      builder: (favController) {
        return HandlingErrors.pageErrorHandling(
            isCircleShown: favController.isFavCircleShown,
            isNoInternetConnection: favController.isFavNoInternetConnection,
            onTapTry: () async {
              await favController.getFavData(lang: lanLocal, token: token);
            },
            page: FavPage());
      },
    );
  }
}
