import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import '../helpers/screen_size_utils.dart';
import 'app_buttons.dart';

class NoConnectionWidget extends StatelessWidget {
  final Function() onTap;

  const NoConnectionWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Expanded(
        //     flex: 2,
        //     child: Image.asset(
        //       'assets/pictures/no-wifi.png',
        //       fit: BoxFit.contain,
        //       width: getWidthInPercent(context, 60),
        //     )),
        TextWidget(
            text: 'No Connection',
            color: AppColors.primaryLight,
            fontSize: getSp(context, 18),
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
            maxline: 2),
        TextWidget(
            text: 'Try again',
            color: AppColors.primaryLight,
            fontSize: getSp(context, 20),
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
            maxline: 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: AppButton.normalButton(
            height: 50,
            width: double.infinity,
            title: 'Try Again',
            backgroundColor: AppColors.primaryDark,
            shadow: false,
            titleColor: AppColors.white,
          ),
        )
      ],
    );
  }
}
