import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/widgets/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/screen_size_utils.dart';

class DialogWidget {
  static void showDialogWidget(
      {required BuildContext context,
      required String title,
      required Function() onConfirm}) {
    Get.defaultDialog(
      title: title,
      titleStyle: TextStyle(
        color: AppColors.primaryDark,
        fontSize: getSp(context, 15),
      ),
      middleText: '',
      radius: 5,
      backgroundColor: AppColors.lightGray,
      actions: [
        AppButton.normalButton(
          title: 'Confirm'.tr,
          shadow: false,
          width: getWidthInPercent(context, 25),
          height: 30,
          titleColor: AppColors.white,
          backgroundColor: AppColors.primaryDark,
          onPress: onConfirm,
        ),
        ///////////////
        AppButton.normalButton(
            title: 'Back'.tr,
            shadow: false,
            width: getWidthInPercent(context, 25),
            backgroundColor: AppColors.white,
            titleColor: AppColors.primaryDark,
            height: 30,
            onPress: () {
              Get.back();
            })
      ],
    );
  }
}
