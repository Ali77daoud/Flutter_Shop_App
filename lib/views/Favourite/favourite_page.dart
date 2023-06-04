import 'package:agora_shop/controllers/Main/fav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/favourite_item.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavController>(
      init: FavController(),
      builder: (favController) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return const FavouriteItem();
          },
          itemCount: 5,
        );
      },
    );
  }
}
