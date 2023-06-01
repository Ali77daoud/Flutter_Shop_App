import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../shared/constants/color_constants.dart';
import '../../../shared/widgets/text_widget.dart';

class HomeCategoryList extends StatelessWidget {
  const HomeCategoryList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 90,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
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
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: const AssetImage(
                          'assets/pictures/clothes_shop.jpg',
                        ),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          // currentSelected == i
                          //     ? Colors.black.withOpacity(.5)
                          Colors.black.withOpacity(.2),
                          BlendMode.darken,
                        ),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: SvgPicture.asset('assets/svg/category.svg',
                        height: 24, width: 24, color: AppColors.lightGray),
                  ),
                  const SizedBox(height: 5),
                  TextWidget(
                      text: 'Category',
                      color: Get.isDarkMode
                          ? AppColors.lightGray
                          : AppColors.primaryDark,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxline: 1),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
