import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

AppBar customAppBar(
    {required String title,
    required Widget leading,
    required bool isContainActions}) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    leading: leading,
    //  Padding(
    //     padding: const EdgeInsets.all(12.0),
    //     child: Image.asset(
    //       'assets/pictures/shopping-bag.png',
    //       fit: BoxFit.contain,
    //     )),
    title: Text(
      title,
      // 'Shop'.tr,
      style: const TextStyle(
        fontSize: 16,
        // color: Get.isDarkMode ? AppColors.grey : AppColors.primaryDark,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: isContainActions
        ? const [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Icon(
                  IconlyBold.notification,
                  size: 22,
                ),
                Positioned(
                  bottom: 32,
                  right: -1,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(width: 15),
          ]
        : null,
  );
}
