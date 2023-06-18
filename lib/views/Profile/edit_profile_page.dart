import 'package:agora_shop/controllers/Profile/profile_controller.dart';
import 'package:agora_shop/views/Profile/component/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/handling_errors.dart/handling_errors.dart';

class EditProfilePage extends StatelessWidget {
  final ProfileController profileController = Get.find<ProfileController>();

  EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<ProfileController>(
      builder: (_) {
        return HandlingErrors.pageErrorHandling(
            isCircleShown: profileController.isGetProfileCircleShown,
            isNoInternetConnection:
                profileController.isGetProfileNoInternetConnection,
            onTapTry: () {},
            page: EditProfile());
      },
    ));
  }
}
