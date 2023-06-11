import 'package:agora_shop/controllers/Favourite/fav_controller.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:agora_shop/views/Favourite/components/fav_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({
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
            onTapTry: () {},
            page: FavPage());
      },
    );
  }
}
