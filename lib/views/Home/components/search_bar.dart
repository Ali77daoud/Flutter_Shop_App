import 'package:agora_shop/controllers/Home/home_controller.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../../shared/constants/color_constants.dart';

class SearchBarWidget extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  SearchBarWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: 45,
          child: TextFormField(
            cursorColor: AppColors.primaryDark,
            onFieldSubmitted: (value) async {
              if (value != '') {
                await homeController.searchProduct(
                    lang: lanLocal, token: token, text: value);
              }
            },
            onChanged: (value) async {
              if (value == '') {
                await homeController.searchProduct(
                    lang: lanLocal, token: token, text: value);
              }
            },
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
              hintText: 'Search'.tr,
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
