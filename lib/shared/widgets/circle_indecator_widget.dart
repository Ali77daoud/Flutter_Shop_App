import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleIndicatorWidget extends StatelessWidget {
  final bool isBgWhite;
  const CircleIndicatorWidget({Key? key, this.isBgWhite = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: isBgWhite
              ? Get.isDarkMode
                  ? AppColors.blackLight
                  : AppColors.white
              : Colors.black.withOpacity(0.3),
        ),
        CircularProgressIndicator(
          color: Get.isDarkMode ? AppColors.lightGray : AppColors.primaryDark,
        )
      ],
    );
  }
}
