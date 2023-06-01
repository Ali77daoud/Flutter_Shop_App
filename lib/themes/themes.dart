// import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/constants/color_constants.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
        //for status bar
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.primaryDark,
            statusBarIconBrightness: Brightness.light),
        titleTextStyle: const TextStyle(
            color: AppColors.primaryDark, fontWeight: FontWeight.w600),
        iconTheme: const IconThemeData(color: AppColors.primaryDark),
        backgroundColor: Colors.grey.shade50,
        elevation: 0),
    // text form field theme
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.white,
      filled: true,
      errorMaxLines: 3,
      labelStyle: const TextStyle(
          color: AppColors.primaryLight, fontWeight: FontWeight.bold),
      floatingLabelStyle: const TextStyle(
        color: AppColors.primaryLight,
        fontWeight: FontWeight.bold,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            style: BorderStyle.solid, color: AppColors.primaryLight, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primaryLight, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
            style: BorderStyle.solid, width: 1, color: Colors.red),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            style: BorderStyle.solid, color: AppColors.primaryLight, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            style: BorderStyle.solid, color: AppColors.primaryLight, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      prefixIconColor: AppColors.primaryLight,
      suffixIconColor: AppColors.primaryLight,
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.primaryDark),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.blue,
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.blackLight,

    /////////appbar
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.blackDark,
      titleTextStyle:
          TextStyle(color: AppColors.grey, fontWeight: FontWeight.w600),
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.grey),
    ),
    bottomAppBarColor: AppColors.darkGrey,
    // text form field theme

    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.grey,
      filled: true,
      errorMaxLines: 3,
      labelStyle: const TextStyle(
          color: AppColors.darkGrey, fontWeight: FontWeight.bold),
      floatingLabelStyle: const TextStyle(
        color: AppColors.darkGrey,
        fontWeight: FontWeight.bold,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            style: BorderStyle.solid, color: AppColors.darkGrey, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.darkGrey, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
            style: BorderStyle.solid, width: 1, color: Colors.red),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            style: BorderStyle.solid, color: AppColors.darkGrey, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            style: BorderStyle.solid, color: AppColors.darkGrey, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      prefixIconColor: AppColors.darkGrey,
      suffixIconColor: AppColors.darkGrey,
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: Colors.white),
  );
}
