import 'package:agora_shop/language/localization.dart';
import 'package:agora_shop/routes/routes.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'app_binding.dart';
import 'controllers/Theme/themes_controller.dart';
import 'shared/constants/lang_constants.dart';
import 'themes/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemesController themeController = Get.put(ThemesController());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter e-commerce app',
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      //for language
      locale: Locale(GetStorage().read<String>('lang').toString()),
      fallbackLocale: const Locale(ene),
      translations: LocalizationApp(),
      ////
      themeMode: getThemeMode(themeController.theme),
      getPages: AppRoutes.routes,
      initialRoute: Routes.splashPage,
      initialBinding: AppBinding(),
    );
  }

  ThemeMode getThemeMode(String type) {
    ThemeMode themeMode = ThemeMode.system;
    switch (type) {
      case "system":
        themeMode = ThemeMode.system;
        break;
      case "dark":
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.light;
        break;
    }

    return themeMode;
  }
}
