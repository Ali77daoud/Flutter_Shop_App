import 'package:agora_shop/controllers/Main/cart_controller.dart';
import 'package:agora_shop/controllers/Main/fav_controller.dart';
import 'package:agora_shop/controllers/Main/home_controller.dart';
import 'package:agora_shop/views/Cart/cart_page.dart';
import 'package:agora_shop/views/Favourite/favourite_page.dart';
import 'package:agora_shop/views/Home/home_page.dart';
import 'package:agora_shop/views/Profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController {
  final storage = GetStorage();
  int i = 0;
  String token = '';

  void changeIndex(int index) {
    i = index;
    update();
  }

  List<Widget> screens = [
    const HomePage(),
    const CartPage(),
    const FavouritePage(),
    ProfilePage()
  ];
}
