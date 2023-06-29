import 'package:agora_shop/controllers/ProductDetails/product_details_controller.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:agora_shop/views/ProductDetails/components/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  final ProductDetailsController productDetailsController =
      Get.find<ProductDetailsController>();
  DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: GetBuilder<ProductDetailsController>(builder: (_) {
      return HandlingErrors.pageErrorHandling(
          isCircleShown: productDetailsController.isProductCircleShown,
          isNoInternetConnection:
              productDetailsController.isProductNoInternetConnection,
          onTapTry: () async {
            productDetailsController.showProductCircleIndicator();
            final int productId = Get.arguments['ProductId'];
            await productDetailsController.getProductDetails(
                lang: lanLocal, token: token, id: productId);
          },
          page: ProductDetails());
    }));
  }
}
