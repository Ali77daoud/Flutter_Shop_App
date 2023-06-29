import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

AppBar appBar() {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    leading: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Image.asset(
          'assets/pictures/shopping-bag.png',
          fit: BoxFit.contain,
        )),
    title: Text(
      'Shop'.tr,
      style: const TextStyle(
        fontSize: 16,
        // color: Get.isDarkMode ? AppColors.grey : AppColors.primaryDark,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: [
      Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: const [
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
      const SizedBox(width: 15),
    ],
  );
}
