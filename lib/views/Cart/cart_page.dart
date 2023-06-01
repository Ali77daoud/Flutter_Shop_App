import 'package:flutter/material.dart';
import 'components/check_out_widget.dart';
import 'components/shopping_cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 140, 0, 0),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const ShoppingCartItem();
              },
              itemCount: 5,
            )),
        const CheckOutWidget(),
      ],
    );
  }
}
