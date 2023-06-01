import 'package:agora_shop/models/Auth/register_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../controllers/Auth/auth_controller.dart';
import '../../routes/routes.dart';
import '../../shared/constants/color_constants.dart';
import '../../shared/constants/validation_const.dart';
import '../../shared/helpers/screen_size_utils.dart';
import '../../shared/widgets/app_buttons.dart';
import '../../shared/widgets/circle_indecator_widget.dart';
import '../../shared/widgets/text_widget.dart';
import 'components/auth_text_field.dart';
import 'components/gradient_headre.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameKey = TextEditingController();
  final TextEditingController emailKey = TextEditingController();
  final TextEditingController passKey = TextEditingController();
  final TextEditingController phoneKey = TextEditingController();
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: GetBuilder<AuthController>(builder: (_) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const GradientHeader(text1: 'SIGN UP', text2: 'New account'),
                  /////////////////////////////////////////////
                  SizedBox(
                    height: getHeightInPercent(context, 5),
                  ),
                  //////////////////////
                  buildBody(context)
                ],
              ),
            ),
            ///////////
            authController.isCircleShown
                ? const CircleIndicatorWidget()
                : Container()
          ],
        );
      }),
    ));
  }

  Widget buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidthInPercent(context, 10)),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AuthTextField(
                textInputType: TextInputType.text,
                isPrefix: true,
                controller: nameKey,
                hintText: 'Enter  Name',
                labelText: 'Name',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Name should not be empty';
                  }
                },
                prefixIcon: const Icon(IconlyBold.profile)),
            ///////
            SizedBox(
              height: getHeightInPercent(context, 2),
            ),
            ////////////
            AuthTextField(
                textInputType: TextInputType.text,
                isPrefix: true,
                controller: emailKey,
                hintText: 'Enter  Email',
                labelText: 'Email',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Email should not be empty';
                  } else if (!RegExp(validationEmail).hasMatch(value)) {
                    return 'Enter valid email';
                  }
                },
                prefixIcon: const Icon(IconlyBold.message)),
            ///////
            SizedBox(
              height: getHeightInPercent(context, 2),
            ),
            ////////////
            AuthTextField(
              textInputType: TextInputType.visiblePassword,
              isPrefix: true,
              controller: passKey,
              hintText: 'Enter  Password',
              labelText: 'Password',
              validator: (value) {
                if (value.isEmpty) {
                  return 'Password should not be empty';
                } else if (value!.length < 8) {
                  return 'Password should not be less than 8 characters';
                }
              },
              prefixIcon: const Icon(IconlyBold.lock),
            ),
            ///////
            SizedBox(
              height: getHeightInPercent(context, 2),
            ),
            ////////////
            AuthTextField(
                textInputType: TextInputType.phone,
                isPrefix: true,
                controller: phoneKey,
                hintText: 'Enter  Phone',
                labelText: 'Phone',
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
              height: getHeightInPercent(context, 6),
            ),
            ////////////
            AppButton.normalButton(
              backgroundColor: AppColors.secondary,
              title: 'SIGN UP',
              onPress: () async {
                if (formKey.currentState!.validate()) {
                  final registerData = RegisterModel(
                      name: nameKey.text,
                      email: emailKey.text,
                      password: passKey.text,
                      phone: phoneKey.text);
                  authController.register(registerModel: registerData);
                }
              },
            ),
            ///////
            SizedBox(
              height: getHeightInPercent(context, 5),
            ),
            // ////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                    text: 'Already have an account?',
                    color: AppColors.primaryDark,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.start,
                    maxline: 1),
                TextButton(
                  onPressed: () {
                    Get.offNamed(Routes.loginPage);
                  },
                  child: TextWidget(
                      text: 'LOGIN',
                      color: AppColors.primaryLight,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.start,
                      maxline: 1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
