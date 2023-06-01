import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarWidgets {
  static void showFailureSnackBar(String title, String message) async {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(255, 158, 15, 5),
        colorText: Colors.white,
        icon: const Icon(Icons.error, color: Colors.white));
  }

  static void showSuccessSnackBar(String title, String message) async {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      icon: const Icon(Icons.check_circle, color: Colors.white),
    );
  }
}
