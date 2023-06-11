import 'package:agora_shop/controllers/Home/home_controller.dart';
import 'package:agora_shop/controllers/Main/main_controller.dart';
import 'package:agora_shop/controllers/ProductDetails/product_details_controller.dart';
import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/helpers/screen_size_utils.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:agora_shop/shared/widgets/app_buttons.dart';
import 'package:agora_shop/shared/widgets/circle_indecator_widget.dart';
import 'package:agora_shop/shared/widgets/text_widget.dart';
import 'package:agora_shop/views/ProductDetails/components/select_size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ProductDetails extends StatelessWidget {
  final ProductDetailsController productDetailsController =
      Get.find<ProductDetailsController>();
  final MainController mainController = Get.find<MainController>();
  final HomeController homeController = Get.find<HomeController>();
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
              print('back');
              await homeController.getHomeData(lang: 'en', token: token!);
              return true;
            },
            child: Scaffold(
              body: ListView(
                children: [
                  Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Center(
                        child: CachedNetworkImage(
                          height: 320,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                                strokeWidth: 3),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          imageUrl: productDetailsController
                              .productDetailsData.data.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 5,
                        left: 15,
                        child: CircleAvatar(
                          backgroundColor: AppColors.secondary,
                          child: IconButton(
                            onPressed: () async {
                              print('back');
                              Get.close(1);
                              await homeController.getHomeData(
                                  lang: 'en', token: token!);
                            },
                            icon: const Icon(
                              IconlyBold.arrow_left_3,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                  text: productDetailsController
                                      .productDetailsData.data.name,
                                  color: AppColors.primaryDark,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  maxline: 2),
                              SizedBox(
                                height: getHeightInPercent(context, 2),
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                      text:
                                          '\$${productDetailsController.productDetailsData.data.price}',
                                      color: AppColors.primaryLight,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      maxline: 2),
                                  SizedBox(
                                    width: getWidthInPercent(context, 10),
                                  ),
                                  TextWidget(
                                      text:
                                          '\$${productDetailsController.productDetailsData.data.oldPrice}',
                                      color:
                                          const Color.fromARGB(255, 109, 3, 3),
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      textDecoration:
                                          TextDecoration.lineThrough,
                                      minFontSize: 8,
                                      maxline: 1),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                              onPressed: () async {
                                await mainController
                                    .addOrDeleteFav(
                                        id: productDetailsController
                                            .productDetailsData.data.id,
                                        lang: 'en',
                                        token: token!)
                                    .then((value) async {
                                  await productDetailsController
                                      .getProductDetails(
                                          id: productDetailsController
                                              .productDetailsData.data.id,
                                          lang: 'en',
                                          token: token!);
                                });
                              },
                              icon: productDetailsController
                                      .productDetailsData.data.inFavorites
                                  ? const Icon(
                                      IconlyBold.heart,
                                      color: Colors.red,
                                      size: 28,
                                    )
                                  : const Icon(
                                      IconlyLight.heart,
                                      color: Colors.red,
                                      size: 28,
                                    )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: AppColors.lightGray,
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextWidget(
                        text: 'Select Size',
                        color: AppColors.primaryDark,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxline: 1),
                  ),
                  const SizedBox(height: 15),
                  const DetailScreenSelectSize(),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: AppColors.lightGray,
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextWidget(
                        text: 'Description',
                        color: AppColors.primaryDark,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxline: 1),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextWidget(
                        text: productDetailsController
                            .productDetailsData.data.description,
                        color: AppColors.grey,
                        fontSize: 15,
                        minFontSize: 13,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxline: 40),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
              bottomNavigationBar: Container(
                height: 60,
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(color: AppColors.lightGray, blurRadius: 20),
                  ],
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 25),
                    const Icon(
                      IconlyBold.buy,
                      size: 30,
                      color: AppColors.primaryDark,
                    ),
                    const SizedBox(width: 35),
                    Expanded(
                      child: AppButton.normalButton(
                          title: 'Add To Cart',
                          height: 40,
                          backgroundColor: AppColors.secondary),
                    ),
                  ],
                ),
              ),
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
}
