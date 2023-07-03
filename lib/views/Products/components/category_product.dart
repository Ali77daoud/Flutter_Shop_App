import 'package:agora_shop/controllers/CategoryProduct/category_product_controller.dart';
import 'package:agora_shop/controllers/Home/home_controller.dart';
import 'package:agora_shop/controllers/Main/main_controller.dart';
import 'package:agora_shop/routes/routes.dart';
import 'package:agora_shop/shared/helpers/screen_size_utils.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:agora_shop/shared/widgets/product_widget.dart';
import 'package:agora_shop/shared/widgets/page_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryProduct extends StatelessWidget {
  final CategoryProductController categoryProductController =
      Get.find<CategoryProductController>();
  final MainController mainController = Get.find<MainController>();
  final HomeController homeController = Get.find<HomeController>();
  CategoryProduct({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryProductController>(builder: (_) {
      return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        PageHeader(
          pageTitle: 'Products',
          onTap: () {
            Get.close(1);
          },
        ),
        ////
        SliverToBoxAdapter(
          child: SizedBox(
            height: getHeightInPercent(context, 3),
          ),
        ),
        //////
        SliverPadding(
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
                  img: categoryProductController
                      .categoryProductData.data.data[i].image,
                  minPrice: categoryProductController
                      .categoryProductData.data.data[i].price
                      .toString(),
                  productName: categoryProductController
                      .categoryProductData.data.data[i].name,
                  inFav: categoryProductController
                      .categoryProductData.data.data[i].inFavorites,
                  inCart: categoryProductController
                      .categoryProductData.data.data[i].inCart,
                  onTap: () {
                    Get.toNamed(
                      Routes.productDetailsPage,
                      arguments: {
                        'ProductId': categoryProductController
                            .categoryProductData.data.data[i].id,
                      },
                    );
                  },
                  onTapCart: () async {
                    ////////////////////////
                    await mainController
                        .addOrRemoveCart(
                            id: categoryProductController
                                .categoryProductData.data.data[i].id,
                            lang: lanLocal,
                            token: token,
                            inCart: !(categoryProductController
                                .categoryProductData.data.data[i].inCart))
                        .then((value) {
                      categoryProductController.showOrHideCatProductIsCart(
                          categoryProductController
                              .categoryProductData.data.data[i].id,
                          mainController.isInCart);
                      /////////
                      homeController.showOrHideHomeIsCart(
                          categoryProductController
                              .categoryProductData.data.data[i].id,
                          mainController.isInCart);
                    });
                  },
                  onTapFav: () async {
                    await mainController
                        .addOrDeleteFav(
                            id: categoryProductController
                                .categoryProductData.data.data[i].id,
                            lang: lanLocal,
                            token: token,
                            inFav: !(categoryProductController
                                .categoryProductData.data.data[i].inFavorites))
                        .then((value) {
                      categoryProductController.showOrHideCatProductIsFav(
                          categoryProductController
                              .categoryProductData.data.data[i].id,
                          mainController.isInFav);
                      /////////
                      homeController.showOrHideHomeIsFav(
                          categoryProductController
                              .categoryProductData.data.data[i].id,
                          mainController.isInFav);
                    });
                  },
                );
              },
              childCount: categoryProductController
                  .categoryProductData.data.data.length,
            ),
          ),
        ),
      ]);
    });
  }
}
