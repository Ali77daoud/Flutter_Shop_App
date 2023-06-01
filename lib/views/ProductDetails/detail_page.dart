import 'package:agora_shop/shared/helpers/screen_size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../shared/constants/color_constants.dart';
import '../../shared/widgets/app_buttons.dart';
import '../../shared/widgets/text_widget.dart';
import 'components/clipper.dart';
import 'components/select_size.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    height: 320,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/pictures/popular1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 15,
                    child: IconButton(
                      onPressed: () {
                        Get.close(1);
                      },
                      icon: const Icon(
                        IconlyBold.arrow_left_3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                            text: 'Product',
                            color: AppColors.primaryDark,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            maxline: 2),
                        SizedBox(
                          height: getHeightInPercent(context, 2),
                        ),
                        Row(
                          children: [
                            TextWidget(
                                text: '\$${200}',
                                color: AppColors.primaryLight,
                                fontSize: 23,
                                fontWeight: FontWeight.normal,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxline: 2),
                            SizedBox(
                              width: getWidthInPercent(context, 10),
                            ),
                            TextWidget(
                                text: '\$${200}',
                                color: const Color.fromARGB(255, 109, 3, 3),
                                fontSize: 23,
                                fontWeight: FontWeight.normal,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                textDecoration: TextDecoration.lineThrough,
                                minFontSize: 8,
                                maxline: 1),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          IconlyLight.heart,
                          color: Colors.red,
                          size: 28,
                        )),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              height: 2,
              color: AppColors.lightGray,
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextWidget(
                  text: 'Select Size',
                  color: AppColors.primaryDark,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxline: 1),
            ),
            const SizedBox(height: 15),
            const DetailScreenSelectSize(),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              height: 2,
              color: AppColors.lightGray,
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextWidget(
                  text: 'Description',
                  color: AppColors.primaryDark,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxline: 1),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextWidget(
                  text:
                      'desc desc desc desc desc desc desc desc descdesc desc desc desc desc desc descdesc desc desc desc desc desc descdesc desc desc desc desc desc descdesc desc desc desc desc desc descdesc desc desc desc desc desc descdesc desc desc desc desc desc descdesc desc',
                  color: AppColors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxline: 20),
            ),
            const SizedBox(height: 25),
          ],
        ),
        bottomNavigationBar: Container(
          height: 60,
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(color: AppColors.lightGray, blurRadius: 20),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 25),
              const Icon(
                IconlyBold.buy,
                size: 30,
                color: AppColors.primaryDark,
              ),
              const SizedBox(width: 35),
              Expanded(
                child: AppButton.normalButton(
                    title: 'Add To Cart',
                    height: 40,
                    backgroundColor: AppColors.secondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
