import 'package:agora_shop/routes/routes.dart';
import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AddressWidget extends StatelessWidget {
  final String title, subTitle;
  const AddressWidget({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
        trailing: InkWell(
          onTap: () {
            Get.toNamed(Routes.addressesPage);
          },
          child: const Icon(
            IconlyBold.edit,
            size: 30,
          ),
        ),
      ),
    );
  }
}
