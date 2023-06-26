import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPageFooter extends StatelessWidget {
  final String text1, text2, route;
  const AuthPageFooter({
    Key? key,
    required this.text1,
    required this.text2,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(
            text: text1,
            color: AppColors.primaryDark,
            fontSize: 13,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.start,
            maxline: 1),
        TextButton(
          onPressed: () {
            Get.offNamed(route);
          },
          child: TextWidget(
              text: text2,
              color: AppColors.primaryLight,
              fontSize: 13,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.start,
              maxline: 1),
        ),
      ],
    );
  }
}
