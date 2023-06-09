import 'package:agora_shop/controllers/Home/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/constants/color_constants.dart';
import '../../../shared/widgets/text_widget.dart';

class HomeCategoryList extends StatelessWidget {
  HomeCategoryList({Key? key}) : super(key: key);
  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 110,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: homeController.categoryData.data.data.length,
          // categoryList.length,
          itemBuilder: (ctx, i) {
            return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 70,
                    decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress, strokeWidth: 3),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      imageUrl: homeController.categoryData.data.data[i].image,
                      fit: BoxFit.contain,
                    ),
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
            );
          },
        ),
      ),
    );
  }
}
