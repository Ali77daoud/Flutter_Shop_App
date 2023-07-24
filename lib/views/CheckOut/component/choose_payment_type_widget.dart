import 'package:agora_shop/controllers/CheckOut/checkout_controller.dart';
import 'package:agora_shop/views/CheckOut/component/payment_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ChoosePaymentTypeWidget extends StatelessWidget {
  const ChoosePaymentTypeWidget({
    super.key,
    required this.checkOutController,
  });

  final CheckOutController checkOutController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PaymentTypeWidget(
          currentPaymentType: checkOutController.paymentType,
          paymentType: 1,
          title: 'Cache',
          icon: Icons.attach_money_sharp,
          onTap: () {
            checkOutController.changePaymentType(1);
          },
        ),
        //////////////////////////
        PaymentTypeWidget(
          currentPaymentType: checkOutController.paymentType,
          paymentType: 2,
          title: 'Online',
          icon: Icons.tap_and_play_sharp,
          onTap: () {
            checkOutController.changePaymentType(2);
          },
        ),
      ],
    );
  }
}
