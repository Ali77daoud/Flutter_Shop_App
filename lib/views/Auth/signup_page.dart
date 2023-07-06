import 'package:agora_shop/models/Auth/register_model.dart';
import 'package:agora_shop/views/Auth/components/auth_page_footer.dart';
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
                  GradientHeader(text1: 'SIGN UP'.tr, text2: 'New account'.tr),
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
            CustomTextField(
              textInputType: TextInputType.text,
              controller: nameKey,
              hintText: 'Enter  Name'.tr,
              labelText: 'Name'.tr,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Name should not be empty'.tr;
                }
              },
              prefixIcon: const Icon(IconlyBold.profile),
              suffixIcon: null,
            ),
            ///////
            SizedBox(
              height: getHeightInPercent(context, 2),
            ),
            ////////////
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
              height: getHeightInPercent(context, 2),
            ),
            ////////////
            CustomTextField(
              textInputType: TextInputType.visiblePassword,
              controller: passKey,
              hintText: 'Enter  Password'.tr,
              labelText: 'Password'.tr,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Password should not be empty'.tr;
                } else if (value!.length < 8) {
                  return 'Password should not be less than 8 characters'.tr;
                }
              },
              prefixIcon: const Icon(IconlyBold.lock),
              suffixIcon: null,
            ),
            ///////
            SizedBox(
              height: getHeightInPercent(context, 2),
            ),
            ////////////
            CustomTextField(
              textInputType: TextInputType.phone,
              controller: phoneKey,
              hintText: 'Enter  Phone'.tr,
              labelText: 'Phone'.tr,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Phone should not be empty'.tr;
                } else if (value!.length < 9 || value!.length > 12) {
                  return 'Phone Number should be between 9 and 12 numbers'.tr;
                }
              },
              prefixIcon: const Icon(IconlyBold.call),
              suffixIcon: null,
            ),

            //////////////

            ///////
            SizedBox(
              height: getHeightInPercent(context, 6),
            ),
            ////////////
            AppButton.normalButton(
              backgroundColor: AppColors.secondary,
              title: 'SIGN UP'.tr,
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
            AuthPageFooter(
              text1: 'Already have an account?'.tr,
              text2: 'LOGIN'.tr,
              route: Routes.loginPage,
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
