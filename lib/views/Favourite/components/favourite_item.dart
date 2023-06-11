import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../../shared/widgets/text_widget.dart';

class FavouriteItem extends StatelessWidget {
  final String img, title;
  final Function() onTapFav;
  final Function() onTapCart;

  const FavouriteItem(
      {super.key,
      required this.img,
      required this.title,
      required this.onTapFav,
      required this.onTapCart});

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
                child: Center(
                  child: CachedNetworkImage(
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress, strokeWidth: 3),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageUrl: img,
                    fit: BoxFit.contain,
                  ),
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
                          text: title,
                          color: Get.isDarkMode
                              ? AppColors.grey
                              : AppColors.primaryDark,
                          fontSize: 13,
                          minFontSize: 10,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          maxline: 3),
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
                          children: [
                            InkWell(
                              onTap: onTapFav,
                              child: const Icon(
                                IconlyBold.heart,
                                color: Colors.red,
                                size: 25,
                              ),
                            ),
                            InkWell(
                              onTap: onTapCart,
                              child: const Icon(
                                IconlyBold.buy,
                                // color: AppColors.primaryDark,
                                size: 25,
                              ),
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
