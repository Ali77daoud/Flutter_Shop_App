import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:agora_shop/views/Cart/components/cart_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/Cart/cart_controller.dart';
import '../../shared/shared_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (cartController) {
        return HandlingErrors.pageErrorHandling(
          isCircleShown: cartController.isCartCircleShown,
          isNoInternetConnection: cartController.isCartNoInternetConnection,
          onTapTry: () async {
            await cartController.getCartData(lang: lanLocal, token: token);
          },
          page: CartBody(),
        );
      },
    );
  }
}
