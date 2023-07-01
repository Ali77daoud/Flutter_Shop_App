import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/widgets/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddOrderWidget extends StatelessWidget {
  const AddOrderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
      child: AppButton.normalButton(
          title: 'Add Order'.tr,
          shadow: false,
          backgroundColor: AppColors.secondary),
    );
  }
}
