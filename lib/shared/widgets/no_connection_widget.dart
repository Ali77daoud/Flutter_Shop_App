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
        Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/no-wifi.png',
              fit: BoxFit.contain,
              width: getWidthInPercent(context, 60),
            )),
        Column(
          children: [
            TextWidget(
                text: 'No Connection',
                color: Colors.black.withOpacity(0.5),
                fontSize: getSp(context, 15),
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                maxline: 2),
            TextWidget(
                text: 'Try again',
                color: Colors.black.withOpacity(0.5),
                fontSize: getSp(context, 15),
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                maxline: 2),
          ],
        ),
        Expanded(
            flex: 1,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: AppButton.normalButton(
                  height: 50,
                  width: double.infinity,
                  title: 'Try Again',
                  backgroundColor: Colors.white,
                  shadow: false,
                  titleColor: Colors.black,
                ),
              ),
            ]))
      ],
    );
  }
}
