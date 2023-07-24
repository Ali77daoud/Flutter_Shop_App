import 'package:agora_shop/controllers/CategoryProduct/category_product_controller.dart';
import 'package:agora_shop/controllers/Home/home_controller.dart';
import 'package:agora_shop/controllers/Main/main_controller.dart';
import 'package:agora_shop/controllers/ProductDetails/product_details_controller.dart';
import 'package:agora_shop/routes/routes.dart';
import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/widgets/circle_indecator_widget.dart';
import 'package:agora_shop/shared/widgets/text_widget.dart';
import 'package:agora_shop/views/ProductDetails/components/product_details_navbar.dart';
import 'package:agora_shop/views/ProductDetails/components/product_image_widget.dart';
import 'package:agora_shop/views/ProductDetails/components/product_name_and_price_widget.dart';
import 'package:agora_shop/views/ProductDetails/components/select_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  final ProductDetailsController productDetailsController =
      Get.find<ProductDetailsController>();
  final MainController mainController = Get.find<MainController>();
  ProductDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (_) {
      return Stack(
        children: [
          WillPopScope(
            onWillPop: () async {
              debugPrint('back');
              bool inFav =
                  productDetailsController.productDetailsData.data.inFavorites;
              bool inCart =
                  productDetailsController.productDetailsData.data.inCart;
              Get.close(1);
              if (Get.currentRoute == Routes.mainPage) {
                final HomeController homeController =
                    Get.find<HomeController>();
                homeController.showOrHideHomeIsFav(
                    productDetailsController.productDetailsData.data.id, inFav);

                homeController.showOrHideHomeIsCart(
                    productDetailsController.productDetailsData.data.id,
                    inCart);
                //////////////
              } else if (Get.currentRoute == Routes.categoryProductPage) {
                final CategoryProductController categoryProductController =
                    Get.find<CategoryProductController>();
                categoryProductController.showOrHideCatProductIsFav(
                  productDetailsController.productDetailsData.data.id,
                  inFav,
                );
                categoryProductController.showOrHideCatProductIsCart(
                  productDetailsController.productDetailsData.data.id,
                  inCart,
                );
              }
              return false;
            },
            child: Scaffold(
              body: ListView(
                children: [
                  ProductImageWidget(
                      productDetailsController: productDetailsController),
                  const SizedBox(height: 5),
                  ProductNameAndPriceWidget(
                      productDetailsController: productDetailsController,
                      mainController: mainController),
                  const SizedBox(height: 12),
                  grayLine(),
                  const SizedBox(height: 12),
                  sectionTitle(txt: 'Select Color'.tr),
                  const SizedBox(height: 15),
                  const DetailScreenSelectColor(),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: AppColors.lightGray,
                  ),
                  const SizedBox(height: 12),
                  sectionTitle(txt: 'Description'.tr),
                  const SizedBox(height: 10),
                  productDescription(),
                  const SizedBox(height: 25),
                ],
              ),
              bottomNavigationBar: ProductDetailsNavBar(
                  productDetailsController: productDetailsController,
                  mainController: mainController),
            ),
          ),
          ////////
          mainController.isMainCircleShown
              ? const CircleIndicatorWidget()
              : Container(),
        ],
      );
    });
  }

  Widget productDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextWidget(
          text: productDetailsController.productDetailsData.data.description,
          color: AppColors.grey,
          fontSize: 15,
          minFontSize: 13,
          fontWeight: FontWeight.normal,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          maxline: 40),
    );
  }

  Widget sectionTitle({required String txt}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextWidget(
          text: txt,
          color: Get.isDarkMode ? AppColors.secondary : AppColors.primaryDark,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          maxline: 1),
    );
  }

  Widget grayLine() {
    return Container(
      width: double.infinity,
      height: 2,
      color: AppColors.lightGray,
    );
  }
}
