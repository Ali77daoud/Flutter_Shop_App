import 'package:agora_shop/controllers/CheckOut/checkout_controller.dart';
import 'package:agora_shop/controllers/Cart/cart_controller.dart';
import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/helpers/screen_size_utils.dart';
import 'package:agora_shop/shared/widgets/check_out_product_widget.dart';
import 'package:agora_shop/shared/widgets/item_animation_widget.dart';
import 'package:agora_shop/shared/widgets/text_widget.dart';
import 'package:agora_shop/views/CheckOut/component/choose_payment_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'address_widget.dart';

class CheckOut extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();
  final CheckOutController checkOutController = Get.find<CheckOutController>();
  CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        sectionTitle(txt: 'Shipping Address'.tr),
        //////////////////
        SliverToBoxAdapter(
          child: SizedBox(
            height: getHeightInPercent(context, 5),
          ),
        ),
        /////////////////////
        SliverToBoxAdapter(
          child: ItemAnimationWidget(
            index: 0,
            isStartAnimation: checkOutController.isStartAnimation,
            child: AddressWidget(
              title: checkOutController.addressData.data.data.isNotEmpty
                  ? checkOutController.addressData.data.data
                      .firstWhere((element) =>
                          element.id == checkOutController.addressCurrentId)
                      .name
                  : 'Empty',
              subTitle: checkOutController.addressData.data.data.isNotEmpty
                  ? checkOutController.addressData.data.data
                      .firstWhere((element) =>
                          element.id == checkOutController.addressCurrentId)
                      .details
                  : 'Empty',
            ),
          ),
        ),
        ////////////////////
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 2,
            color: Get.isDarkMode ? AppColors.grey : AppColors.lightGray,
          ),
        ),
        //////////////////
        SliverToBoxAdapter(
          child: SizedBox(
            height: getHeightInPercent(context, 3),
          ),
        ),
        /////////////////////
        sectionTitle(txt: 'Payment Type'),
        /////////////////
        SliverToBoxAdapter(
          child: SizedBox(
            height: getHeightInPercent(context, 3),
          ),
        ),
        /////////////////////
        SliverToBoxAdapter(
          child:
              ChoosePaymentTypeWidget(checkOutController: checkOutController),
        ),
        ////////////////////
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 2,
            color: Get.isDarkMode ? AppColors.grey : AppColors.lightGray,
          ),
        ),
        //////////////////
        SliverToBoxAdapter(
          child: SizedBox(
            height: getHeightInPercent(context, 3),
          ),
        ),
        /////////////////////
        sectionTitle(txt: 'Products'.tr),
        /////////////////
        SliverToBoxAdapter(
          child: SizedBox(
            height: getHeightInPercent(context, 3),
          ),
        ),
        /////////////////////
        SliverToBoxAdapter(
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: cartController.cartData.data.cartItems.length,
              itemBuilder: (context, index) {
                return ItemAnimationWidget(
                  index: index,
                  isStartAnimation: checkOutController.isStartAnimation,
                  child: CheckOutProductsWidget(
                    img: cartController
                        .cartData.data.cartItems[index].product.image,
                    title: cartController
                        .cartData.data.cartItems[index].product.name,
                    price: cartController
                        .cartData.data.cartItems[index].product.price
                        .toString(),
                    quantity: cartController
                        .cartData.data.cartItems[index].quantity
                        .toString(),
                  ),
                );
              }),
        ),
      ]),
    );
  }

  Widget sectionTitle({required String txt}) {
    return SliverToBoxAdapter(
      child: TextWidget(
          text: txt,
          color: AppColors.secondary,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          maxline: 1),
    );
  }
}
