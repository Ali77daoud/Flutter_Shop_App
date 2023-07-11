import 'package:agora_shop/controllers/Favorite/fav_controller.dart';
import 'package:agora_shop/controllers/Main/main_controller.dart';
import 'package:agora_shop/shared/widgets/item_animation_widget.dart';
import 'package:agora_shop/views/Favorite/components/favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/shared_variables.dart';

class FavPage extends StatelessWidget {
  final FavController favController = Get.find<FavController>();
  final MainController mainController = Get.find<MainController>();

  FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return favController.favData.data.data.isEmpty
        ? const Center(
            child: Text('Fav is Empty'),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return ItemAnimationWidget(
                index: index,
                isStartAnimation: favController.isStartAnimation,
                child: FavouriteItem(
                  img: favController.favData.data.data[index].product.image,
                  title: favController.favData.data.data[index].product.name,
                  onTapCart: () async {
                    await mainController.addOrRemoveCart(
                        id: favController.favData.data.data[index].product.id,
                        lang: lanLocal,
                        token: token);
                  },
                  onTapFav: () async {
                    await mainController
                        .addOrDeleteFav(
                            id: favController
                                .favData.data.data[index].product.id,
                            lang: lanLocal,
                            token: token)
                        .then((value) async {
                      await favController.getFavData(
                          lang: lanLocal, token: token);
                    });
                  },
                ),
              );
            },
            itemCount: favController.favData.data.data.length,
          );
  }
}
