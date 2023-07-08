import 'package:agora_shop/controllers/Cart/cart_controller.dart';
import 'package:agora_shop/controllers/Main/main_controller.dart';
import 'package:agora_shop/routes/routes.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:agora_shop/views/Cart/components/check_out_widget.dart';
import 'package:agora_shop/views/Cart/components/shopping_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartBody extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();
  final MainController mainController = Get.find<MainController>();

  CartBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ShoppingCartItem(
                  img: cartController
                      .cartData.data.cartItems[index].product.image,
                  title: cartController
                      .cartData.data.cartItems[index].product.name,
                  price: cartController
                      .cartData.data.cartItems[index].product.price
                      .toString(),
                  quantity: cartController
                      .cartData.data.cartItems[index].quantity
                      .toString(),
                  addOne: () async {
                    int q =
                        cartController.cartData.data.cartItems[index].quantity;
                    await mainController
                        .updateCart(
                            id: cartController
                                .cartData.data.cartItems[index].id,
                            lang: lanLocal,
                            token: token,
                            quantity: q + 1)
                        .then((value) async {
                      await cartController.getCartData(
                          lang: lanLocal, token: token);
                    });
                  },
                  removeOne: () async {
                    int q =
                        cartController.cartData.data.cartItems[index].quantity;
                    if (q > 1) {
                      await mainController
                          .updateCart(
                              id: cartController
                                  .cartData.data.cartItems[index].id,
                              lang: lanLocal,
                              token: token,
                              quantity: q - 1)
                          .then((value) async {
                        await cartController.getCartData(
                            lang: lanLocal, token: token);
                      });
                    }
                  },
                  onTapDelete: () async {
                    await mainController
                        .deleteCart(
                            id: cartController
                                .cartData.data.cartItems[index].id,
                            lang: lanLocal,
                            token: token)
                        .then((value) async {
                      await cartController.getCartData(
                          lang: lanLocal, token: token);
                    });
                  },
                );
              },
              itemCount: cartController.cartData.data.cartItems.length,
            )),
        CheckOutWidget(
          subTotal: cartController.cartData.data.subTotal.toString(),
          total: cartController.cartData.data.total.toString(),
          onTapCheck: () {
            cartController.cartData.data.cartItems.isNotEmpty
                ? Get.toNamed(Routes.checkOutPage)
                : null;
          },
        ),
      ],
    );
  }
}
