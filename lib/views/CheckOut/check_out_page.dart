import 'package:agora_shop/shared/widgets/page_header.dart';
import 'package:agora_shop/shared/widgets/text_widget.dart';
import 'package:agora_shop/views/CheckOut/component/add_order_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/Cart/cart_controller.dart';
import '../../shared/constants/color_constants.dart';
import '../../shared/helpers/screen_size_utils.dart';
import 'component/address_widget.dart';
import 'component/check_out_product_widget.dart';

class CheckOutPage extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();
  CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const AddOrderWidget(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                PageHeader(pageTitle: 'CheckOut'.tr),
                //////////////////
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: getHeightInPercent(context, 5),
                  ),
                ),
                /////////////////////
                sectionTitle(txt: 'Shipping Address'.tr),
                //////////////////
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: getHeightInPercent(context, 5),
                  ),
                ),
                /////////////////////
                const AddressWidget(),
                ////////////////////
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: double.infinity,
                    height: 2,
                    color: AppColors.lightGray,
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
                //////////////////
                SliverToBoxAdapter(
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cartController.cartData.data.cartItems.length,
                      itemBuilder: (context, index) {
                        return CheckOutProductsWidget(
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
                        );
                      }),
                ),
              ]),
        ),
      ),
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
