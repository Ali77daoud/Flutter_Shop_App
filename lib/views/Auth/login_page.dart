import 'package:agora_shop/controllers/Auth/auth_controller.dart';
import 'package:agora_shop/models/Auth/login_model.dart';
import 'package:agora_shop/shared/widgets/app_buttons.dart';
import 'package:agora_shop/views/Auth/components/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../routes/routes.dart';
import '../../shared/constants/color_constants.dart';
import '../../shared/constants/validation_const.dart';
import '../../shared/helpers/screen_size_utils.dart';
import '../../shared/widgets/circle_indecator_widget.dart';
import '../../shared/widgets/text_widget.dart';
import 'components/gradient_headre.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailKey = TextEditingController();
  final TextEditingController passKey = TextEditingController();
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<AuthController>(builder: (_) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const GradientHeader(
                      text1: 'LOGIN',
                      text2: 'To your account',
                    ),
                    /////////////////////////////////////////////
                    SizedBox(
                      height: getHeightInPercent(context, 10),
                    ),
                    //////////////////////
                    buildBody(context)
                  ],
                ),
              ),
              ///////////
              authController.isCircleShown
                  ? const CircleIndicatorWidget(
                      isBgWhite: false,
                    )
                  : Container()
            ],
          );
        }),
      ),
    );
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
              height: getHeightInPercent(context, 3),
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
            //////////////
            ///
            ///////
            SizedBox(
              height: getHeightInPercent(context, 10),
            ),
            ////////////
            AppButton.normalButton(
              backgroundColor: AppColors.secondary,
              title: 'LOGIN',
              onPress: () async {
                if (formKey.currentState!.validate()) {
                  final loginData =
                      LoginModel(email: emailKey.text, password: passKey.text);
                  await authController.login(loginModel: loginData);
                }
              },
            ),
            ///////
            SizedBox(
              height: getHeightInPercent(context, 10),
            ),
            // ////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                    text: 'Dont have an account?',
                    color: AppColors.primaryDark,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.start,
                    maxline: 1),
                TextButton(
                  onPressed: () {
                    Get.offNamed(Routes.signUpPage);
                  },
                  child: TextWidget(
                      text: 'SIGN UP',
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
