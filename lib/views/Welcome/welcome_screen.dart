import 'package:agora_shop/routes/routes.dart';
import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/helpers/screen_size_utils.dart';
import 'package:agora_shop/shared/widgets/app_buttons.dart';
import 'package:agora_shop/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int currentPage = 0;

  List<String> picturesList = [
    'assets/pictures/1.png',
    'assets/pictures/2.png',
    'assets/pictures/3.png',
  ];
  /////////////////////
  List<String> titleList = [
    'Welcome to our online store\nwhere shopping becomes\nan experience.',
    'Shop the latest trends\nand timeless classics\nall in one place.',
    'Browse, shop ,and indulge\nin the joy of online shopping\nwith us.',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: Image.asset(
                  picturesList[currentPage],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: PageView.builder(
                  onPageChanged: (i) {
                    setState(() => currentPage = i);
                  },
                  itemCount: 3,
                  itemBuilder: (ctx, i) {
                    return TextWidget(
                        text: titleList[i],
                        // 'Find your best outfit\nand look great',
                        color: AppColors.primaryDark,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                        maxline: 3);
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: AnimatedContainer(
                    height: 5,
                    width: currentPage == index ? 20 : 5,
                    duration: const Duration(milliseconds: 800),
                    decoration: BoxDecoration(
                      color: currentPage == index
                          ? AppColors.primaryDark
                          : AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: getHeightInPercent(context, 3)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppButton.normalButton(
                backgroundColor: AppColors.primaryDark,
                title: 'Get Started',
                onPress: () {
                  Get.offNamed(Routes.loginPage);
                },
              ),
            ),
            SizedBox(height: getHeightInPercent(context, 3)),
          ],
        ),
      ),
    );
  }
}
