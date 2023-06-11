import 'package:agora_shop/controllers/Favourite/fav_controller.dart';
import 'package:agora_shop/controllers/Main/main_controller.dart';
import 'package:agora_shop/views/Favourite/components/favourite_item.dart';
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
              return FavouriteItem(
                img: favController.favData.data.data[index].product.image,
                title: favController.favData.data.data[index].product.name,
                onTapCart: () {
                  print('cart');
                },
                onTapFav: () async {
                  await mainController
                      .addOrDeleteFav(
                          id: favController.favData.data.data[index].product.id,
                          token: token!)
                      .then((value) async {
                    await favController.getFavData(lang: 'en', token: token!);
                  });
                },
              );
            },
            itemCount: favController.favData.data.data.length,
          );
  }
}
