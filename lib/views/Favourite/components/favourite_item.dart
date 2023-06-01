import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../shared/widgets/text_widget.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
        height: 140,
        child: Card(
          elevation: 3,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/pictures/popular1.jpg'),
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              //////////////
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 12, top: 10, right: 5),
                      child: TextWidget(
                          text: 'Philips 42FYHFH45 81 Cm FullHD',
                          color: Get.isDarkMode
                              ? AppColors.grey
                              : AppColors.primaryDark,
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          maxline: 2),
                    ),
                    ////////////////////
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? AppColors.darkGrey
                              : AppColors.white,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                                color: Get.isDarkMode
                                    ? AppColors.blackLight
                                    : AppColors.lightGray,
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: const Offset(0, -1))
                          ]),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(
                              IconlyBold.heart,
                              color: Colors.red,
                              size: 25,
                            ),
                            Icon(
                              IconlyBold.buy,
                              // color: AppColors.primaryDark,
                              size: 25,
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
