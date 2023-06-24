import 'package:agora_shop/controllers/CategoryProduct/category_product_controller.dart';
import 'package:agora_shop/controllers/Main/main_controller.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:agora_shop/shared/widgets/circle_indecator_widget.dart';
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
                lang: 'en', token: token!, categoryId: categoryId);
          },
          page: SafeArea(
            child: Scaffold(body: GetBuilder<MainController>(builder: (_) {
              return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                  child: Stack(
                    children: [
                      CategoryProduct(),
                      mainController.isMainCircleShown
                          ? const CircleIndicatorWidget()
                          : Container()
                    ],
                  ));
            })),
          ));
    }));
  }
}
