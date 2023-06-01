import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../shared/constants/color_constants.dart';
import '../../../shared/widgets/text_widget.dart';

class ShoppingCartItem extends StatelessWidget {
  const ShoppingCartItem({super.key});

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
                  Container(
                    height: 100,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/pictures/popular1.jpg'),
                      fit: BoxFit.cover,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 10, 2, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {},
                          splashColor: AppColors.primaryLight,
                          borderRadius: BorderRadius.circular(30),
                          child: const Icon(
                            Icons.remove_circle_outline,
                          ),
                        ),
                        TextWidget(
                            text: '1',
                            color: Get.isDarkMode
                                ? AppColors.lightGray
                                : AppColors.primaryDark,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                            maxline: 1),
                        InkWell(
                          onTap: () {},
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
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: const Icon(
                            IconlyBold.close_square,
                            size: 25,
                            // color: AppColors.primaryDark,
                          ),
                          onPressed: () {},
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
                              text: '\$ 2.500',
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
