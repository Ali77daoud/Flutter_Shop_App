import 'package:agora_shop/controllers/CheckOut/checkout_controller.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:agora_shop/shared/widgets/circle_indecator_widget.dart';
import 'package:agora_shop/shared/widgets/custom_app_bar.dart';
import 'package:agora_shop/views/CheckOut/component/add_order_widget.dart';
import 'package:agora_shop/views/CheckOut/component/check_out.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/constants/color_constants.dart';

class CheckOutPage extends StatelessWidget {
  final CheckOutController checkOutController = Get.find<CheckOutController>();
  CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: GetBuilder<CheckOutController>(builder: (_) {
      return HandlingErrors.pageErrorHandling(
        isCircleShown: checkOutController.isGetAddressCircleShown,
        isNoInternetConnection:
            checkOutController.isGetAddressNoInternetConnection,
        onTapTry: () async {
          await checkOutController.getAddressData(lang: lanLocal, token: token);
        },
        page: Stack(
          children: [
            Scaffold(
                appBar: customAppBar(
                    title: 'CheckOut'.tr,
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
                bottomNavigationBar: AddOrderWidget(),
                body: CheckOut()),
            checkOutController.isAddOrderCircleShown
                ? const CircleIndicatorWidget()
                : Container(),
          ],
        ),
      );
    }));
  }
}
