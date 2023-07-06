import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../../shared/helpers/screen_size_utils.dart';
import '../../../shared/widgets/text_widget.dart';

class AddressesWidget extends StatelessWidget {
  final IconData icon;
  final Function() onTap;
  final String title, subTitle, region;

  const AddressesWidget({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.title,
    required this.subTitle,
    required this.region,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Card(
        elevation: 5,
        child: Center(
          child: ListTile(
            leading: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: AppColors.lightGray, shape: BoxShape.circle),
                ),
                //////
                Container(
                  width: 35,
                  height: 35,
                  decoration: const BoxDecoration(
                      color: AppColors.primaryLight, shape: BoxShape.circle),
                  child: const Center(
                      child: Icon(
                    IconlyBold.location,
                    size: 20,
                    color: AppColors.darkWhite,
                  )),
                ),
              ],
            ),
            title: TextWidget(
                text: title,
                color: AppColors.primaryDark,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxline: 1),
            subtitle: TextWidget(
                text: subTitle,
                color: AppColors.grey,
                fontSize: 11,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxline: 2),
            trailing: SizedBox(
              width: getWidthInPercent(context, 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextWidget(
                        text: region,
                        color: AppColors.grey,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxline: 2),
                  ),
                  ////////////////////
                  InkWell(
                    onTap: onTap,
                    child: Icon(
                      icon,
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
