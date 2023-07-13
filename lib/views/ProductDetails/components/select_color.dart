import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/constants/color_constants.dart';

class DetailScreenSelectColor extends StatefulWidget {
  const DetailScreenSelectColor({Key? key}) : super(key: key);

  @override
  State<DetailScreenSelectColor> createState() =>
      _DetailScreenSelectColorState();
}

class _DetailScreenSelectColorState extends State<DetailScreenSelectColor> {
  int currentSelected = 0;

  List<Color> colorList = [
    AppColors.white,
    AppColors.blackLight,
    AppColors.primaryDark,
    AppColors.grey,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colorList.length,
        itemBuilder: (ctx, i) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentSelected = i;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colorList[i],
                border: Border.all(
                    color: currentSelected == i
                        ? AppColors.secondary
                        : AppColors.lightGray,
                    width: 3),
                boxShadow: [
                  BoxShadow(
                    color: Get.isDarkMode
                        ? AppColors.blackLight
                        : AppColors.lightGray.withOpacity(.7),
                    blurRadius: 5,
                  ),
                ],
              ),
              alignment: Alignment.center,
            ),
          );
        },
      ),
    );
  }
}
