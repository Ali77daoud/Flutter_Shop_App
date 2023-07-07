import 'package:agora_shop/controllers/Orders/orders_controller.dart';
import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:agora_shop/shared/widgets/custom_app_bar.dart';
import 'package:agora_shop/views/Orders/components/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPage extends StatelessWidget {
  final OrdersController ordersController = Get.find<OrdersController>();
  OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: customAppBar(
                title: 'Orders'.tr,
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
            body: GetBuilder<OrdersController>(builder: (_) {
              return HandlingErrors.pageErrorHandling(
                  isCircleShown: ordersController.isGetOrdersCircleShown,
                  isNoInternetConnection:
                      ordersController.isGetOrdersNoInternetConnection,
                  onTapTry: () async {
                    ordersController.getOrdersData(
                        lang: lanLocal, token: token);
                  },
                  page: Orders());
            })));
  }
}
