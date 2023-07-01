import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/constants/lang_constants.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:agora_shop/shared/widgets/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      decoration: BoxDecoration(
        color: Get.isDarkMode ? AppColors.darkGrey : AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
              color: Get.isDarkMode
                  ? AppColors.blackLight
                  : AppColors.lightGray.withOpacity(.7),
              blurRadius: 20),
        ],
      ),
      child: Directionality(
        textDirection: lanLocal == ara ? TextDirection.ltr : TextDirection.rtl,
        child: Row(
          children: [
            const SizedBox(width: 25),
            Icon(
              IconlyBold.buy,
              size: 30,
              color:
                  Get.isDarkMode ? AppColors.lightGray : AppColors.primaryDark,
            ),
            const SizedBox(width: 35),
            Expanded(
              child: AppButton.normalButton(
                  title: 'Add To Cart'.tr,
                  height: 40,
                  shadow: false,
                  backgroundColor: AppColors.secondary),
            ),
          ],
        ),
      ),
    );
  }
}
