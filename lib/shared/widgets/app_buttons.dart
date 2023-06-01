import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class AppButton {
  static normalButton({
    required String title,
    VoidCallback? onPress,
    Color? backgroundColor = AppColors.darkGrey,
    Color? titleColor = Colors.white,
    bool shadow = true,
    double height = 50,
    double width = double.infinity,
  }) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: shadow
              ? const [
                  BoxShadow(color: AppColors.lightGray, blurRadius: 5),
                ]
              : null,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
