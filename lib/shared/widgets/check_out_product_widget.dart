import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/widgets/text_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutProductsWidget extends StatelessWidget {
  final String img, title, price, quantity;
  const CheckOutProductsWidget({
    Key? key,
    required this.title,
    required this.price,
    required this.img,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 0, left: 8.0, right: 8.0),
        height: 140,
        child: Card(
          elevation: 3,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
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
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextWidget(
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
                      ////////////////////
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: TextWidget(
                            text: '\$ $price *$quantity',
                            color: Get.isDarkMode
                                ? AppColors.secondary
                                : AppColors.primaryLight,
                            fontSize: 14,
                            minFontSize: 14,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxline: 1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
