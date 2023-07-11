import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  bool isStartAnimation = false;

  void startAnimation() {
    isStartAnimation = true;
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    debugPrint('address Controller Init');
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startAnimation();
    });
  }

  @override
  void onClose() async {
    super.onClose();
    debugPrint('address Controller closed');
  }
}
