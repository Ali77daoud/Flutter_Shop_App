import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/helpers/screen_size_utils.dart';
import 'package:agora_shop/shared/widgets/app_buttons.dart';
import 'package:agora_shop/shared/widgets/page_header.dart';
import 'package:agora_shop/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import '../Auth/components/auth_text_field.dart';

class AddAddressPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameKey = TextEditingController();
  final TextEditingController cityKey = TextEditingController();
  final TextEditingController regionKey = TextEditingController();
  final TextEditingController strKey = TextEditingController();
  final TextEditingController noteKey = TextEditingController();
  AddAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                PageHeader(pageTitle: 'Add Address'.tr),
                //////////////////
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: getHeightInPercent(context, 3),
                  ),
                ),
                /////////////////////
                SliverToBoxAdapter(
                  child: Container(
                    width: double.infinity,
                    height: getHeightInPercent(context, 30),
                    color: AppColors.primaryDark,
                  ),
                ),
                //////////////////
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: getHeightInPercent(context, 3),
                  ),
                ),
                /////////////////////
                sectionTitle(txt: 'Address Details'.tr),
                //////////////////
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: getHeightInPercent(context, 3),
                  ),
                ),
                /////////////////////
                _addressFormSection(context),
              ])),
    ));
  }

  Widget sectionTitle({required String txt}) {
    return SliverToBoxAdapter(
      child: TextWidget(
          text: txt,
          color: AppColors.secondary,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          maxline: 1),
    );
  }

  //////////////////////
  Widget _addressFormSection(BuildContext context) {
    return SliverToBoxAdapter(
      child: Form(
          key: formKey,
          child: Column(
            children: [
              AuthTextField(
                  textInputType: TextInputType.text,
                  controller: nameKey,
                  hintText: '  Place Name'.tr,
                  isHintColor: true,
                  isLableText: false,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Place Name should not be empty'.tr;
                    }
                  },
                  suffixIcon: null,
                  prefixIcon: null),
              /////////////
              SizedBox(
                height: getHeightInPercent(context, 2),
              ),
              //////////////
              Row(
                children: [
                  Expanded(
                    child: AuthTextField(
                      textInputType: TextInputType.text,
                      controller: cityKey,
                      prefixIcon: null,
                      suffixIcon: null,
                      hintText: '  City'.tr,
                      isHintColor: true,
                      isLableText: false,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'City Name should not be empty'.tr;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  /////////////
                  Expanded(
                    child: AuthTextField(
                      textInputType: TextInputType.text,
                      controller: regionKey,
                      hintText: '  Region'.tr,
                      isHintColor: true,
                      isLableText: false,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Region Name should not be empty'.tr;
                        }
                      },
                      suffixIcon: null,
                      prefixIcon: null,
                    ),
                  )
                ],
              ),
              /////////////
              SizedBox(
                height: getHeightInPercent(context, 2),
              ),
              //////////////
              AuthTextField(
                textInputType: TextInputType.text,
                controller: strKey,
                hintText: '  Street'.tr,
                isHintColor: true,
                isLableText: false,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Street Name should not be empty'.tr;
                  }
                },
                suffixIcon: null,
                prefixIcon: null,
              ),
              /////////////
              SizedBox(
                height: getHeightInPercent(context, 2),
              ),
              //////////////
              AuthTextField(
                textInputType: TextInputType.text,
                controller: noteKey,
                hintText: '  Notes'.tr,
                isHintColor: true,
                isLableText: false,
                maxLines: 4,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Notes should not be empty'.tr;
                  }
                },
                suffixIcon: null,
                prefixIcon: null,
              ),

              //////////////
              SizedBox(
                height: getHeightInPercent(context, 3),
              ),
              ////////////
              AppButton.normalButton(
                backgroundColor: AppColors.secondary,
                title: 'Add Address'.tr,
                shadow: false,
                onPress: () {
                  if (formKey.currentState!.validate()) {}
                },
              ),
              // ///////
              SizedBox(
                height: getHeightInPercent(context, 3),
              ),
              ////////////
            ],
          )),
    );
  }
}
