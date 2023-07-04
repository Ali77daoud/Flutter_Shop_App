import 'package:agora_shop/controllers/Address/address_controller.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:agora_shop/shared/widgets/custom_app_bar.dart';
import 'package:agora_shop/views/CheckOut/component/add_order_widget.dart';
import 'package:agora_shop/views/CheckOut/component/check_out.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/constants/color_constants.dart';

class CheckOutPage extends StatelessWidget {
  final AddressController addressController = Get.find<AddressController>();
  CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: GetBuilder<AddressController>(builder: (_) {
      return HandlingErrors.pageErrorHandling(
        isCircleShown: addressController.isGetAddressCircleShown,
        isNoInternetConnection:
            addressController.isGetAddressNoInternetConnection,
        onTapTry: () async {
          await addressController.getAddressData(lang: lanLocal, token: token);
        },
        page: Scaffold(
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
            bottomNavigationBar: const AddOrderWidget(),
            body: CheckOut()),
      );
    }));
  }
}
