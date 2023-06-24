import 'dart:async';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../routes/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool selected = false;
  @override
  void initState() {
    super.initState();
    token = GetStorage().read('token') ?? '';
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        selected = true;
      });
      Timer(const Duration(seconds: 3, milliseconds: 500), () {
        goToHomeScreen();
      });
    });
  }

  goToHomeScreen() {
    GetStorage().read<bool>('isLogin') == true
        ? Get.offNamed(Routes.mainPage)
        : Get.offNamed(Routes.welcomePage);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/pictures/splash_backgrounf.png',
                      ),
                      fit: BoxFit.cover))),
          AnimatedContainer(
            width: selected ? 130 : 60,
            height: selected ? 130 : 60,
            alignment:
                selected ? Alignment.center : AlignmentDirectional.topCenter,
            duration: const Duration(seconds: 3),
            curve: Curves.fastOutSlowIn,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/pictures/shopping-bag.png',
                    ),
                    fit: BoxFit.contain)),
          ),
        ],
      )),
    );
  }
}
