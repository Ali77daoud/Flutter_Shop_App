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
  @override
  void initState() {
    super.initState();
    token = GetStorage().read('token') ?? '';
    Timer(const Duration(seconds: 2), () => goToHomeScreen());
  }

  goToHomeScreen() {
    GetStorage().read<bool>('isLogin') == true
        ? Get.offNamed(Routes.mainPage)
        : Get.offNamed(Routes.welcomePage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Page'),
      ),
      body: const Center(
        child: Text('Splash Page'),
      ),
    );
  }
}
