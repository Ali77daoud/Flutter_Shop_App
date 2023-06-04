import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

AppBar appBar() {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    leading: const Padding(
      padding: EdgeInsets.all(12.0),
      child: Icon(
        Icons.menu_sharp,
      ),
    ),
    title: const Text(
      'AgOrA Shop',
      style: TextStyle(
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
