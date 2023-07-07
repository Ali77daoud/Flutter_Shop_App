import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../shared/constants/color_constants.dart';
import '../../../shared/widgets/text_widget.dart';

class ShoppingCartItem extends StatelessWidget {
  final String img, title, price, quantity;
  final Function() addOne;
  final Function() removeOne;
  final Function() onTapDelete;
  const ShoppingCartItem(
      {super.key,
      required this.img,
      required this.title,
      required this.price,
      required this.addOne,
      required this.removeOne,
      required this.quantity,
      required this.onTapDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      height: 160,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: (MediaQuery.of(context).size.width) / 3,
              child: Column(
                children: [
                  CachedNetworkImage(
                    height: 100,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress, strokeWidth: 3),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageUrl: img,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 10, 2, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: removeOne,
                          splashColor: AppColors.primaryLight,
                          borderRadius: BorderRadius.circular(30),
                          child: const Icon(
                            Icons.remove_circle_outline,
                          ),
                        ),
                        TextWidget(
                            text: quantity,
                            color: Get.isDarkMode
                                ? AppColors.lightGray
                                : AppColors.primaryDark,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                            maxline: 1),
                        InkWell(
                          onTap: addOne,
                          splashColor: AppColors.primaryLight,
                          borderRadius: BorderRadius.circular(30),
                          child: const Icon(
                            Icons.add_circle_outline,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width - 37) / 1.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, top: 5),
                          child: TextWidget(
                              text: title,
                              color: Get.isDarkMode
                                  ? AppColors.grey
                                  : AppColors.primaryDark,
                              fontSize: 13,
                              minFontSize: 11,
                              fontWeight: FontWeight.normal,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              maxline: 4),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: const Icon(
                            IconlyBold.close_square,
                            size: 25,
                          ),
                          onPressed: onTapDelete,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextWidget(
                              text: '\$ $price',
                              color: Get.isDarkMode
                                  ? AppColors.secondary
                                  : AppColors.primaryLight,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              maxline: 1),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
