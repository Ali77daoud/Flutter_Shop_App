import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ProductWidget extends StatelessWidget {
  final String img, productName, minPrice, maxPrice;
  final Function()? onTap;
  const ProductWidget(
      {Key? key,
      required this.img,
      required this.productName,
      required this.minPrice,
      required this.maxPrice,
      required this.onTap})
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
              child: ClipPath(
                clipper: MyClipper(),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: AssetImage(img),
                      fit: BoxFit.cover,
                    ),
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
                                fontSize: 15,
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
                                TextWidget(
                                    text: '\$$minPrice',
                                    color: AppColors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    minFontSize: 8,
                                    maxline: 1),
                                const SizedBox(
                                  width: 15,
                                ),
                                TextWidget(
                                    text: '\$$maxPrice',
                                    color: Get.isDarkMode
                                        ? const Color.fromARGB(255, 233, 81, 81)
                                        : const Color.fromARGB(255, 109, 3, 3),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    textDecoration: TextDecoration.lineThrough,
                                    minFontSize: 8,
                                    maxline: 1),
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
                        onPressed: () {
                          // setState(() {
                          //   popularList[i].favorite =
                          //       !popularList[i].favorite;
                          // });
                        },
                        icon: const Icon(
                          IconlyBold.heart,
                          color: Colors.red,
                          size: 18,
                        )),
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
              width: double.infinity,
              color:
                  Get.isDarkMode ? AppColors.secondary : AppColors.primaryDark,
              child: const Icon(
                IconlyBold.buy,
                size: 15,
                color: AppColors.white,
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