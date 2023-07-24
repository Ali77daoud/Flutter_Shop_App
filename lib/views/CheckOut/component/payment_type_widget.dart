import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentTypeWidget extends StatelessWidget {
  final Function() onTap;
  final int currentPaymentType;
  final int paymentType;
  final String title;
  final IconData icon;
  const PaymentTypeWidget({
    super.key,
    required this.onTap,
    required this.currentPaymentType,
    required this.paymentType,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 63,
        height: 63,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(
                color: AppColors.primaryDark,
                width: currentPaymentType == paymentType ? 3 : 1),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextWidget(
                text: title,
                color: Get.isDarkMode ? AppColors.grey : AppColors.primaryDark,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxline: 1),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
