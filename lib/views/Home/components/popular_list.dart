import 'package:agora_shop/controllers/Home/home_controller.dart';
import 'package:agora_shop/controllers/Main/main_controller.dart';
import 'package:agora_shop/routes/routes.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:agora_shop/shared/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePopularList extends StatelessWidget {
  HomePopularList({Key? key}) : super(key: key);
  final HomeController homeController = Get.find<HomeController>();
  final MainController mainController = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 243.0,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 0.65,
        ),
        delegate: SliverChildBuilderDelegate(
          (ctx, i) {
            return ProductWidget(
              img: homeController.homeData.data.products[i].image,
              maxPrice:
                  homeController.homeData.data.products[i].oldPrice.toString(),
              minPrice:
                  homeController.homeData.data.products[i].price.toString(),
              productName: homeController.homeData.data.products[i].name,
              inFav: homeController.homeData.data.products[i].inFavorites,
              inCart: homeController.homeData.data.products[i].inCart,
              onTap: () {
                print(homeController.homeData.data.products[i].id);
                Get.toNamed(Routes.productDetailsPage, arguments: {
                  'ProductId': homeController.homeData.data.products[i].id,
                });
              },
              onTapCart: () {
                print('cart');
              },
              onTapFav: () async {
                await mainController
                    .addOrDeleteFav(
                        id: homeController.homeData.data.products[i].id,
                        token: token!)
                    .then((value) async {
                  await homeController.getHomeData(lang: 'en', token: token!);
                });
              },
            );
          },
          childCount: homeController.homeData.data.products.length,
        ),
      ),
    );
  }
}
