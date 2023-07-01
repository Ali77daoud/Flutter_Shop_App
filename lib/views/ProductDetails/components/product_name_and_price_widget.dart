import 'package:agora_shop/controllers/Main/main_controller.dart';
import 'package:agora_shop/controllers/ProductDetails/product_details_controller.dart';
import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/helpers/screen_size_utils.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:agora_shop/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ProductNameAndPriceWidget extends StatelessWidget {
  const ProductNameAndPriceWidget({
    Key? key,
    required this.productDetailsController,
    required this.mainController,
  }) : super(key: key);

  final ProductDetailsController productDetailsController;
  final MainController mainController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          nameAndPrice(context),
          favButton(),
        ],
      ),
    );
  }

  Widget favButton() {
    return Expanded(
      flex: 1,
      child: IconButton(
          onPressed: () async {
            await mainController
                .addOrDeleteFav(
                    id: productDetailsController.productDetailsData.data.id,
                    lang: lanLocal,
                    token: token)
                .then((value) async {
              await productDetailsController.getProductDetails(
                  id: productDetailsController.productDetailsData.data.id,
                  lang: lanLocal,
                  token: token);
            });
          },
          icon: productDetailsController.productDetailsData.data.inFavorites
              ? const Icon(
                  IconlyBold.heart,
                  color: Colors.red,
                  size: 28,
                )
              : const Icon(
                  IconlyLight.heart,
                  color: Colors.red,
                  size: 28,
                )),
    );
  }

  Widget nameAndPrice(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
              text: productDetailsController.productDetailsData.data.name,
              color: Get.isDarkMode ? AppColors.grey : AppColors.primaryDark,
              fontSize: 19,
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
                  text:
                      '\$${productDetailsController.productDetailsData.data.price}',
                  color: Get.isDarkMode
                      ? AppColors.lightGray
                      : AppColors.primaryLight,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxline: 2),
              SizedBox(
                width: getWidthInPercent(context, 10),
              ),
              TextWidget(
                  text:
                      '\$${productDetailsController.productDetailsData.data.oldPrice}',
                  color: Get.isDarkMode
                      ? const Color.fromARGB(255, 141, 5, 5)
                      : const Color.fromARGB(255, 109, 3, 3),
                  fontSize: 20,
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
    );
  }
}
