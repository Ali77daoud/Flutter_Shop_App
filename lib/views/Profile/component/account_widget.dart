import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconly/iconly.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? name = GetStorage().read<String>('name');
    String? email = GetStorage().read<String>('email');
    return Container(
      height: 80,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Get.isDarkMode ? AppColors.grey : AppColors.lightGray),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Get.isDarkMode ? AppColors.grey : Colors.grey.shade300),
            child: Center(
              child: Icon(
                IconlyBold.profile,
                size: 32,
                color: Get.isDarkMode ? AppColors.lightGray : AppColors.grey,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                  text: name!,
                  color: Get.isDarkMode
                      ? AppColors.blackLight
                      : AppColors.primaryDark,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                  maxline: 1),
              /////////////////
              TextWidget(
                  text: email!,
                  color: Get.isDarkMode
                      ? AppColors.blackLight
                      : AppColors.primaryDark,
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  textAlign: TextAlign.start,
                  maxline: 1),
            ],
          ),
        ],
      ),
    );
  }
}
