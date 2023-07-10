import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class OrderDetailsWidget extends StatelessWidget {
  final String title;
  final String value;

  const OrderDetailsWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 37,
            decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.grey, width: 0)),
            child: Center(
              child: TextWidget(
                  text: title,
                  color: AppColors.secondary,
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  textAlign: TextAlign.center,
                  maxline: 2),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 37,
            decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.grey, width: 0)),
            child: Center(
              child: TextWidget(
                  text: value,
                  color: AppColors.primaryLight,
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  textAlign: TextAlign.center,
                  maxline: 2),
            ),
          ),
        ),
      ],
    );
  }
}
