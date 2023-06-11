import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/widgets/app_buttons.dart';
import '../../../shared/widgets/text_widget.dart';

class CheckOutWidget extends StatelessWidget {
  final String subTotal, total;
  final Function() onTapCheck;
  const CheckOutWidget({
    Key? key,
    required this.subTotal,
    required this.total,
    required this.onTapCheck,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 135,
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: BoxDecoration(
          color: Get.isDarkMode ? AppColors.darkGrey : AppColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                color:
                    Get.isDarkMode ? AppColors.blackDark : AppColors.lightGray,
                blurRadius: 15),
          ],
        ),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                            text: 'Subtotal',
                            color: Get.isDarkMode
                                ? AppColors.grey
                                : AppColors.primaryDark,
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            maxline: 1),
                        // const Text("Subtotal"),
                        TextWidget(
                            text: '\$ $subTotal',
                            color: AppColors.secondary,
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            maxline: 1),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                            text: 'Total',
                            color: Get.isDarkMode
                                ? AppColors.grey
                                : AppColors.primaryDark,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            maxline: 1),
                        // const Text("Subtotal"),
                        TextWidget(
                            text: '\$ $total',
                            color: AppColors.secondary,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            maxline: 1),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),
              child: AppButton.normalButton(
                  onPress: onTapCheck,
                  title: 'Checkout',
                  shadow: false,
                  height: 40,
                  backgroundColor: AppColors.secondary),
            ),
          ],
        ));
  }
}
