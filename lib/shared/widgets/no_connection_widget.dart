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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/pictures/no_connectoin.jpg',
            fit: BoxFit.cover,
            width: 250,
          ),
          //////////
          TextWidget(
              text: 'No Connection\nTry again',
              color: AppColors.primaryLight,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
              maxline: 2),
          /////////
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
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
