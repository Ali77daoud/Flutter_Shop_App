import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../shared/constants/color_constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: 45,
          child: TextFormField(
            cursorColor: AppColors.primaryDark,
            style: TextStyle(
                color: Get.isDarkMode ? AppColors.darkGrey : AppColors.grey),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              // fillColor: AppColors.darkWhite,
              filled: true,
              contentPadding: const EdgeInsets.all(10),
              hintText: 'Search',
              hintStyle: TextStyle(
                color: Get.isDarkMode ? AppColors.darkGrey : AppColors.grey,
              ),
              prefixIcon: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(
                    IconlyLight.search,
                    color: Get.isDarkMode ? AppColors.darkGrey : AppColors.grey,
                    size: 20,
                  )),
            ),
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
