import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/widgets/text_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ProductWidget extends StatelessWidget {
  final String img, productName, minPrice;
  // maxPrice;
  final bool inFav, inCart;
  final Function()? onTap;
  final Function()? onTapFav;
  final Function()? onTapCart;
  const ProductWidget(
      {Key? key,
      required this.img,
      required this.productName,
      required this.minPrice,
      // required this.maxPrice,
      required this.onTap,
      required this.onTapFav,
      required this.onTapCart,
      required this.inFav,
      required this.inCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
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
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 55,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextWidget(
                                text: productName,
                                color: Get.isDarkMode
                                    ? AppColors.lightGray
                                    : AppColors.primaryDark,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                minFontSize: 10,
                                maxline: 2),
                          ),
                          /////////////
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextWidget(
                                      text: '\$$minPrice',
                                      color: AppColors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      minFontSize: 9,
                                      maxline: 1),
                                ),
                                // const SizedBox(
                                //   width: 8,
                                // ),
                                // Expanded(
                                //   child: TextWidget(
                                //       text: '\$$maxPrice',
                                //       color: Get.isDarkMode
                                //           ? const Color.fromARGB(
                                //               255, 233, 81, 81)
                                //           : const Color.fromARGB(
                                //               255, 109, 3, 3),
                                //       fontSize: 12,
                                //       fontWeight: FontWeight.bold,
                                //       textAlign: TextAlign.start,
                                //       overflow: TextOverflow.ellipsis,
                                //       textDecoration:
                                //           TextDecoration.lineThrough,
                                //       minFontSize: 9,
                                //       maxline: 1),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        onPressed: onTapFav,
                        icon: inFav
                            ? const Icon(
                                IconlyBold.heart,
                                color: Colors.red,
                                size: 18,
                              )
                            : const Icon(
                                IconlyLight.heart,
                                color: Colors.red,
                                size: 18,
                              )),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: onTapCart,
              child: Container(
                height: 30,
                width: double.infinity,
                color: Get.isDarkMode
                    ? AppColors.secondary
                    : AppColors.primaryDark,
                child: inCart
                    ? const Icon(
                        IconlyBold.buy,
                        size: 18,
                        color: AppColors.white,
                      )
                    : const Icon(
                        IconlyLight.buy,
                        size: 18,
                        color: AppColors.white,
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()..moveTo(0, 0);

    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(0, size.height, 20, size.height);

    path.lineTo(size.width - 20, size.height - 20);
    path.quadraticBezierTo(
        size.width, size.height - 25, size.width, size.height - 50);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
