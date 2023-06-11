import 'package:agora_shop/controllers/Main/main_controller.dart';
import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/widgets/circle_indecator_widget.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../controllers/Theme/themes_controller.dart';
import '../../shared/widgets/custom_app_bar.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final MainController mainController = Get.find<MainController>();
  final ThemesController themesController = Get.find<ThemesController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemesController>(builder: (_) {
      return GetBuilder<MainController>(builder: (_) {
        return SafeArea(
            child: Stack(
          children: [
            Scaffold(
              appBar: appBar(),
              extendBody: true,
              bottomNavigationBar: buildNavBar(),
              body: mainController.screens[mainController.i],
            ),
            mainController.isMainCircleShown
                ? const CircleIndicatorWidget()
                : Container()
          ],
        ));
      });
    });
  }

  Widget buildNavBar() {
    return DotNavigationBar(
      items: [
        DotNavigationBarItem(
          icon: const Icon(IconlyLight.home),
          selectedColor: themesController.isDark()
              ? AppColors.secondary
              : AppColors.primaryDark,
          unselectedColor: AppColors.grey,
        ),
        /////////////////
        DotNavigationBarItem(
          icon: const Icon(IconlyLight.buy),
          selectedColor: themesController.isDark()
              ? AppColors.secondary
              : AppColors.primaryDark,
          unselectedColor: AppColors.grey,
        ),
        /////////////////////
        DotNavigationBarItem(
          icon: const Icon(IconlyLight.heart),
          selectedColor: themesController.isDark()
              ? AppColors.secondary
              : AppColors.primaryDark,
          unselectedColor: AppColors.grey,
        ),
        ////////////////////
        DotNavigationBarItem(
          icon: const Icon(IconlyLight.profile),
          selectedColor: themesController.isDark()
              ? AppColors.secondary
              : AppColors.primaryDark,
          unselectedColor: AppColors.grey,
        ),
      ],
      marginR: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      currentIndex: mainController.i,
      backgroundColor:
          themesController.isDark() ? AppColors.darkGrey : AppColors.darkWhite,
      curve: Curves.bounceOut,
      duration: const Duration(milliseconds: 800),
      boxShadow: [
        BoxShadow(
          color:
              themesController.isDark() ? AppColors.blackDark : AppColors.grey,
          blurRadius: 3,
          spreadRadius: 1,
          offset: const Offset(0, 1),
        )
      ],
      onTap: (index) async {
        if (index == 0) {
          if (mainController.i != 0) {
            debugPrint('0');
          }
        }
        if (index == 1) {
          if (mainController.i != 1) {
            debugPrint('1');
          }
        }

        if (index == 2) {
          if (mainController.i != 2) {
            debugPrint('2');
          }
        }
        if (index == 3) {
          if (mainController.i != 3) {
            debugPrint('3');
          }
        }
        mainController.changeIndex(index);
      },
    );
  }
}
