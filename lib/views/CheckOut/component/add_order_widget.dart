import 'package:agora_shop/controllers/CheckOut/checkout_controller.dart';
import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:agora_shop/shared/widgets/app_buttons.dart';
import 'package:agora_shop/shared/widgets/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddOrderWidget extends StatelessWidget {
  final CheckOutController checkOutController = Get.find<CheckOutController>();
  AddOrderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: BoxDecoration(
        color: Get.isDarkMode ? AppColors.darkGrey : AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
              color: Get.isDarkMode
                  ? AppColors.blackLight
                  : AppColors.lightGray.withOpacity(.7),
              blurRadius: 20),
        ],
      ),
      child: AppButton.normalButton(
          onPress: () {
            DialogWidget.showDialogWidget(
                context: context,
                title: 'Are you sure to add the order ?'.tr,
                onConfirm: () async {
                  Get.back();
                  await checkOutController.addOrder(
                      lang: lanLocal,
                      token: token,
                      addressId: checkOutController.addressCurrentId);
                });
          },
          title: 'Add Order'.tr,
          shadow: false,
          backgroundColor: AppColors.secondary),
    );
  }
}
