import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemesController extends GetxController {
  final storage = GetStorage();

  var theme = 'light';

  @override
  void onInit() {
    super.onInit();

    getThemeState();
  }

  getThemeState() {
    if (storage.read('theme') != null) {
      return setTheme(storage.read('theme'));
    }

    setTheme('light');
  }

  bool isDark() {
    String theme = storage.read('theme');
    if (theme == 'light') {
      return false;
    } else if (theme == 'dark') {
      return true;
    } else {
      return false;
    }
  }

  void setTheme(String value) {
    theme = value;
    storage.write('theme', value);
    if (value == 'system') Get.changeThemeMode(ThemeMode.system);
    if (value == 'light') Get.changeThemeMode(ThemeMode.light);
    if (value == 'dark') Get.changeThemeMode(ThemeMode.dark);
    update();
  }
}
