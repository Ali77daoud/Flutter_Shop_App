import 'package:agora_shop/controllers/Home/home_controller.dart';
import 'package:agora_shop/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/constants/color_constants.dart';
import '../../../shared/widgets/text_widget.dart';

class HomeCategoryList extends StatelessWidget {
  HomeCategoryList({Key? key}) : super(key: key);
  final HomeController homeController = Get.find<HomeController>();

  final List<String> img = [
    'assets/pictures/responsive.png',
    'assets/pictures/mask.png',
    'assets/pictures/running.png',
    'assets/pictures/spotlight.png',
    'assets/pictures/wardrobe.png',
  ];
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 90,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: homeController.categoryData.data.data.length,
          // categoryList.length,
          itemBuilder: (ctx, i) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: InkWell(
                onTap: () {
                  debugPrint(
                      homeController.categoryData.data.data[i].id.toString());
                  Get.toNamed(Routes.categoryProductPage, arguments: {
                    'CategoryId': homeController.categoryData.data.data[i].id,
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 60,
                      decoration: BoxDecoration(
                          color: AppColors.lightGray,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage(img[i]), fit: BoxFit.contain)),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 70,
                      child: TextWidget(
                          text: homeController.categoryData.data.data[i].name,
                          color: Get.isDarkMode
                              ? AppColors.lightGray
                              : AppColors.primaryDark,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxline: 2),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
