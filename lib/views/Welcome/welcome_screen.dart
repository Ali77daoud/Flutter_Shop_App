import 'package:agora_shop/routes/routes.dart';
import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/helpers/screen_size_utils.dart';
import 'package:agora_shop/shared/widgets/app_buttons.dart';
import 'package:agora_shop/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/clipper.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int currentPage = 0;

  List<Widget> picturesList = [
    Image.asset(
      'assets/pictures/3.png',
      key: UniqueKey(),
    ),
    Image.asset(
      'assets/pictures/2.png',
      key: UniqueKey(),
    ),
    Image.asset(
      'assets/pictures/1.png',
      key: UniqueKey(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: ClipPath(
                clipper: MyClipper(),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      color: AppColors.primaryDark,
                    ),
                    const Positioned(
                      top: 50,
                      right: -100,
                      child: CircleAvatar(
                        backgroundColor: AppColors.primaryLight,
                        radius: 120,
                      ),
                    ),
                    const Positioned(
                      top: 130,
                      left: -50,
                      child: CircleAvatar(
                        backgroundColor: AppColors.secondary,
                        radius: 80,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Opacity(
                        opacity: 0.1,
                        child: Image.asset(
                          'assets/pictures/background_vector.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 25,
                      bottom: 0,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: picturesList[currentPage],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: PageView.builder(
                onPageChanged: (i) {
                  setState(() => currentPage = i);
                },
                itemCount: 3,
                itemBuilder: (ctx, i) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextWidget(
                          text: 'Find your best outfit\nand look great',
                          color: AppColors.primaryDark,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                          maxline: 3),
                      SizedBox(height: getHeightInPercent(context, 2)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: TextWidget(
                              text:
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, standard dummy text ever since the 1500s.',
                              color: AppColors.primaryLight,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center,
                              minFontSize: 10,
                              overflow: TextOverflow.ellipsis,
                              maxline: 4),
                        ),
                      ),
                    ],
                  );
                },
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
