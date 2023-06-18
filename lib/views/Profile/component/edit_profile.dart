import 'package:agora_shop/controllers/Main/main_controller.dart';
import 'package:agora_shop/controllers/Profile/profile_controller.dart';
import 'package:agora_shop/models/Auth/update_profile_model.dart';
import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/constants/validation_const.dart';
import 'package:agora_shop/shared/helpers/screen_size_utils.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:agora_shop/shared/widgets/app_buttons.dart';
import 'package:agora_shop/shared/widgets/circle_indecator_widget.dart';
import 'package:agora_shop/views/Auth/components/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../../shared/widgets/text_widget.dart';

class EditProfile extends StatelessWidget {
  final ProfileController profileController = Get.find<ProfileController>();
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameKey = TextEditingController();
  final TextEditingController emailKey = TextEditingController();
  final TextEditingController phoneKey = TextEditingController();
  EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (_) {
      return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _firstSection(),
                  ////////////////////
                  SizedBox(
                    height: getHeightInPercent(context, 8),
                  ),
                  /////////////////////
                  _secondSection(),
                  //////////////////////
                  SizedBox(
                    height: getHeightInPercent(context, 10),
                  ),
                  /////////////////////
                  _thirdSection(context)
                ],
              ),
            ),
          ),
          ///////////
          profileController.isUpdateProfileCircleShown
              ? const CircleIndicatorWidget()
              : Container()
        ],
      );
    });
  }

  Widget _firstSection() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Get.close(1);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Get.isDarkMode ? AppColors.white : AppColors.primaryDark,
          ),
        ),
        Expanded(
          child: TextWidget(
              text: 'Profile',
              color: Get.isDarkMode ? AppColors.white : AppColors.primaryDark,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
              maxline: 1),
        ),
      ],
    );
  }

  Widget _secondSection() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Get.isDarkMode ? AppColors.grey : Colors.grey.shade300),
      child: Center(
        child: Icon(
          IconlyBold.profile,
          size: 50,
          color: Get.isDarkMode ? AppColors.lightGray : AppColors.grey,
        ),
      ),
    );
  }

  Widget _thirdSection(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            AuthTextField(
                textInputType: TextInputType.text,
                isPrefix: true,
                controller: nameKey,
                hintText: profileController.userData.name,
                isHintColor: true,
                isLableText: false,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Name should not be empty';
                  }
                },
                prefixIcon: const Icon(IconlyBold.profile)),
            /////////////
            SizedBox(
              height: getHeightInPercent(context, 3),
            ),
            //////////////
            AuthTextField(
                textInputType: TextInputType.text,
                isPrefix: true,
                controller: emailKey,
                hintText: profileController.userData.email,
                isLableText: false,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Email should not be empty';
                  } else if (!RegExp(validationEmail).hasMatch(value)) {
                    return 'Enter valid email';
                  }
                },
                prefixIcon: const Icon(IconlyBold.message)),
            /////////////////////////////////////
            SizedBox(
              height: getHeightInPercent(context, 3),
            ),
            ////////////
            AuthTextField(
                textInputType: TextInputType.phone,
                isPrefix: true,
                controller: phoneKey,
                hintText: profileController.userData.phone,
                isLableText: false,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Phone should not be empty';
                  } else if (value!.length < 9 || value!.length > 12) {
                    return 'Phone Number should be between 9 and 12 numbers';
                  }
                },
                prefixIcon: const Icon(IconlyBold.call)),

            //////////////

            ///////
            SizedBox(
              height: getHeightInPercent(context, 8),
            ),
            ////////////
            ///
            AppButton.normalButton(
              backgroundColor: AppColors.secondary,
              title: 'Update Profile',
              shadow: false,
              onPress: () async {
                if (formKey.currentState!.validate()) {
                  final updateProfileModel = UpdateProfileModel(
                      name: nameKey.text,
                      email: emailKey.text,
                      phone: phoneKey.text,
                      img: '');

                  await profileController
                      .updateProfile(
                          updateProfileModel: updateProfileModel,
                          token: token!,
                          lang: 'en')
                      .then((value) async {
                    await profileController.getUserData(
                        lang: 'en', token: token!);
                  });
                }
              },
            ),
            ///////
            SizedBox(
              height: getHeightInPercent(context, 6),
            ),
            ////////////
          ],
        ));
  }
}
