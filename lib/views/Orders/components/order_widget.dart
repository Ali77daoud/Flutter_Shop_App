import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/helpers/screen_size_utils.dart';
import 'package:agora_shop/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class OrderWidget extends StatelessWidget {
  final String total, status, date;
  final int index;
  final Function() onTapDetails;
  final Function() onTapCancel;
  const OrderWidget({
    super.key,
    required this.total,
    required this.status,
    required this.date,
    required this.index,
    required this.onTapDetails,
    required this.onTapCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
              color: AppColors.lightGray,
              offset: Offset(0, 4),
              blurRadius: 2,
              spreadRadius: 1)
        ],
      ),
      child: Row(
        children: [
          Container(
            height: getHeightInPercent(context, 100),
            width: getWidthInPercent(context, 10),
            color: AppColors.primaryDark,
            child: Center(
              child: TextWidget(
                  text: '# ${index + 1}',
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  maxline: 2),
            ),
          ),
          ////////////////////
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                      text: total,
                      // 'Total : 12765 \$',
                      color: AppColors.darkGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                      maxline: 2),
                  /////////////
                  TextWidget(
                      text: status,
                      // 'Status : Cancelled',
                      color: AppColors.darkGrey,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                      maxline: 2),
                  /////////////
                  TextWidget(
                      text: date,
                      // 'Date : 29 / 06 / 2023',
                      color: AppColors.darkGrey,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                      maxline: 2),
                ],
              ),
            ),
          ),
          ////////////////////
          Expanded(
            flex: 1,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  IconlyBold.close_square,
                  // color: Colors.red,
                  size: 25,
                )),
          ),
          ////////////////////
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () async {},
              child: Container(
                color: AppColors.primaryDark,
                child: Center(
                  child: TextWidget(
                      text: 'Details',
                      color: AppColors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                      maxline: 2),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
