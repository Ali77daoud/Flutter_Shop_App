import 'package:agora_shop/controllers/CategoryProduct/category_product_controller.dart';
import 'package:agora_shop/controllers/Home/home_controller.dart';
import 'package:agora_shop/controllers/ProductDetails/product_details_controller.dart';
import 'package:agora_shop/routes/routes.dart';
import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({
    Key? key,
    required this.productDetailsController,
  }) : super(key: key);

  final ProductDetailsController productDetailsController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        productImg(),
        backButton(),
      ],
    );
  }

  Widget backButton() {
    return Positioned(
      top: 5,
      left: 15,
      child: CircleAvatar(
        backgroundColor: AppColors.secondary,
        child: IconButton(
          onPressed: () async {
            debugPrint('back');
            Get.close(1);
            if (Get.currentRoute == Routes.mainPage) {
              final HomeController homeController = Get.find<HomeController>();

              await homeController
                  .getHomeData(lang: 'en', token: token!)
                  .then((value) async {
                await homeController.getCategoryData(lang: 'en', token: token!);
              });
            } else if (Get.currentRoute == Routes.categoryProductPage) {
              final CategoryProductController categoryProductController =
                  Get.find<CategoryProductController>();

              await categoryProductController.getCategoryProduct(
                  lang: 'en',
                  token: token!,
                  categoryId: Get.arguments['CategoryId']);
            }
          },
          icon: const Icon(
            IconlyBold.arrow_left_3,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  Widget productImg() {
    return Center(
      child: CachedNetworkImage(
        height: 320,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(
              value: downloadProgress.progress, strokeWidth: 3),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        imageUrl: productDetailsController.productDetailsData.data.image,
        fit: BoxFit.cover,
      ),
    );
  }
}
