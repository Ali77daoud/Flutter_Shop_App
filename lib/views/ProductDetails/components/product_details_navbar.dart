import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/widgets/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProductDetailsNavBar extends StatelessWidget {
  const ProductDetailsNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
