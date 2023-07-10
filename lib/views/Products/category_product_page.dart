import 'package:agora_shop/controllers/CategoryProduct/category_product_controller.dart';
import 'package:agora_shop/controllers/Main/main_controller.dart';
import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:agora_shop/shared/widgets/circle_indecator_widget.dart';
import 'package:agora_shop/shared/widgets/custom_app_bar.dart';
import 'package:agora_shop/views/Products/components/category_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryProductPage extends StatelessWidget {
  final CategoryProductController categoryProductController =
      Get.find<CategoryProductController>();
  final MainController mainController = Get.find<MainController>();

  CategoryProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: GetBuilder<CategoryProductController>(builder: (_) {
      return HandlingErrors.pageErrorHandling(
          isCircleShown: categoryProductController.isCategoryProductCircleShown,
          isNoInternetConnection:
              categoryProductController.isCategoryProductNoInternetConnection,
          onTapTry: () async {
            categoryProductController.showCategoryProductCircleIndicator();
            final int categoryId = Get.arguments['CategoryId'];
            await categoryProductController.getCategoryProduct(
                lang: lanLocal, token: token, categoryId: categoryId);
          },
          page: Scaffold(
              appBar: customAppBar(
                  title: 'Products'.tr,
                  leading: InkWell(
                    onTap: () {
                      Get.close(1);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Get.isDarkMode
                          ? AppColors.white
                          : AppColors.primaryDark,
                    ),
                  ),
                  isContainActions: false),
              body: GetBuilder<MainController>(builder: (_) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 10),
                      child: CategoryProduct(),
                    ),
                    mainController.isMainCircleShown
                        ? const CircleIndicatorWidget()
                        : Container()
                  ],
                );
              })));
    }));
  }
}
