import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helpers/screen_size_utils.dart';
import 'app_buttons.dart';

class NoConnectionWidget extends StatelessWidget {
  final Function() onTap;

  const NoConnectionWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? AppColors.blackLight : AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/pictures/no_connectoin.png',
            fit: BoxFit.cover,
            width: 350,
          ),
          //////////
          TextWidget(
              text: 'No Connection\nTry again',
              color: AppColors.primaryLight,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
              maxline: 2),
          /////////
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: AppButton.normalButton(
                height: 50,
                width: double.infinity,
                title: 'Try Again',
                backgroundColor: AppColors.primaryDark,
                shadow: false,
                titleColor: AppColors.white,
                onPress: onTap),
          ),
          //////////
          SizedBox(
            height: getHeightInPercent(context, 8),
          ),
          ////////////
        ],
      ),
    );
  }
}
