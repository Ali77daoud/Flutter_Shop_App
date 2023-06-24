import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstSection extends StatelessWidget {
  const FirstSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.close(1);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Get.isDarkMode ? AppColors.white : AppColors.primaryDark,
            ),
          ),
          Expanded(
            child: TextWidget(
                text: 'Products',
                color: Get.isDarkMode ? AppColors.white : AppColors.primaryDark,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                maxline: 1),
          ),
        ],
      ),
    );
  }
}
