import 'package:agora_shop/controllers/Auth/auth_controller.dart';
import 'package:agora_shop/models/Auth/login_model.dart';
import 'package:agora_shop/shared/widgets/app_buttons.dart';
import 'package:agora_shop/views/Auth/components/auth_page_footer.dart';
import 'package:agora_shop/views/Auth/components/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../routes/routes.dart';
import '../../shared/constants/color_constants.dart';
import '../../shared/constants/validation_const.dart';
import '../../shared/helpers/screen_size_utils.dart';
import '../../shared/widgets/circle_indecator_widget.dart';
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
                    GradientHeader(
                      text1: 'LOGIN'.tr,
                      text2: 'To your account'.tr,
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
            CustomTextField(
              textInputType: TextInputType.text,
              controller: emailKey,
              hintText: 'Enter  Email'.tr,
              labelText: 'Email'.tr,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Email should not be empty'.tr;
                } else if (!RegExp(validationEmail).hasMatch(value)) {
                  return 'Enter valid email'.tr;
                }
              },
              prefixIcon: const Icon(IconlyBold.message),
              suffixIcon: null,
            ),
            ///////
            SizedBox(
              height: getHeightInPercent(context, 3),
            ),
            ////////////
            CustomTextField(
              textInputType: TextInputType.visiblePassword,
              controller: passKey,
              hintText: 'Enter  Password'.tr,
              labelText: 'Password'.tr,
              isObscure: authController.isObscure,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Password should not be empty'.tr;
                } else if (value!.length < 8) {
                  return 'Password should not be less than 8 characters'.tr;
                }
              },
              prefixIcon: const Icon(IconlyBold.lock),
              suffixIcon: IconButton(
                icon: Icon(authController.isObscure
                    ? Icons.visibility_off
                    : Icons.visibility),
                onPressed: () {
                  authController.changeIsObscure();
                },
              ),
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
              title: 'LOGIN'.tr,
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
            AuthPageFooter(
              text1: 'Dont have an account?'.tr,
              text2: 'SIGN UP'.tr,
              route: Routes.signUpPage,
            ),
            ///////
            SizedBox(
              height: getHeightInPercent(context, 3),
            ),
            // ////////////
          ],
        ),
      ),
    );
  }
}
