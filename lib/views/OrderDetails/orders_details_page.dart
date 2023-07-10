import 'package:agora_shop/controllers/OrderDetails.dart/order_details_controller.dart';
import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:agora_shop/shared/widgets/custom_app_bar.dart';
import 'package:agora_shop/views/OrderDetails/components/order_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersDetailsPage extends StatelessWidget {
  final OrderDetailsController orderDetailsController =
      Get.find<OrderDetailsController>();
  OrdersDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: customAppBar(
                title: 'Orders Details'.tr,
                leading: InkWell(
                  onTap: () {
                    Get.close(1);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Get.isDarkMode
                        ? AppColors.white
                        : AppColors.primaryDark,
                  ),
                ),
                isContainActions: false),
            body: GetBuilder<OrderDetailsController>(builder: (_) {
              return HandlingErrors.pageErrorHandling(
                  isCircleShown:
                      orderDetailsController.isGetOrderDetailsCircleShown,
                  isNoInternetConnection: orderDetailsController
                      .isGetOrderDetailsNoInternetConnection,
                  onTapTry: () async {
                    await orderDetailsController.getOrderDetailsData(
                        lang: lanLocal,
                        token: token,
                        orderId: Get.arguments['orderId']);
                  },
                  page: OrderDetails());
            })));
  }
}
