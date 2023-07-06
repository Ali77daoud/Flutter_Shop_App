import 'package:agora_shop/controllers/Address/address_controller.dart';
import 'package:agora_shop/controllers/Map/map_controller.dart';
import 'package:agora_shop/models/Address/add_address_model.dart';
import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/helpers/screen_size_utils.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:agora_shop/shared/widgets/app_buttons.dart';
import 'package:agora_shop/shared/widgets/circle_indecator_widget.dart';
import 'package:agora_shop/shared/widgets/custom_app_bar.dart';
import 'package:agora_shop/shared/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Auth/components/auth_text_field.dart';
import 'components/google_map_widget.dart';

class AddAddressPage extends StatelessWidget {
  final MapController mapController = Get.find<MapController>();
  final AddressController addressController = Get.find<AddressController>();
  final formKey = GlobalKey<FormState>();

  final TextEditingController noteKey = TextEditingController();
  AddAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
      onWillPop: () async {
        Get.close(1);
        if (addressController.newAddressAdded) {
          await addressController.getAddressData(lang: lanLocal, token: token);
          addressController.newAddressAdded = false;
        }
        return false;
      },
      child: Scaffold(
          appBar: customAppBar(
              title: 'Add Address'.tr,
              leading: InkWell(
                onTap: () async {
                  Get.close(1);
                  if (addressController.newAddressAdded) {
                    await addressController.getAddressData(
                        lang: lanLocal, token: token);
                    addressController.newAddressAdded = false;
                  }
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color:
                      Get.isDarkMode ? AppColors.white : AppColors.primaryDark,
                ),
              ),
              isContainActions: false),
          body: GetBuilder<AddressController>(builder: (_) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Column(
                      children: [
                        GoogleMapWidget(),
                        Expanded(
                          child: CustomScrollView(
                              physics: const BouncingScrollPhysics(),
                              slivers: [
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
                              ]),
                        ),
                      ],
                    )),
                addressController.isAddAddressCircleShown
                    ? const CircleIndicatorWidget()
                    : Container()
              ],
            );
          })),
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
              CustomTextField(
                  textInputType: TextInputType.text,
                  controller: mapController.nameKey,
                  hintText: '  Place Name'.tr,
                  isHintColor: true,
                  isLableText: true,
                  labelText: '  Place Name'.tr,
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
                    child: CustomTextField(
                      textInputType: TextInputType.text,
                      controller: mapController.cityKey,
                      prefixIcon: null,
                      suffixIcon: null,
                      hintText: '  City'.tr,
                      labelText: '  City'.tr,
                      isHintColor: true,
                      isLableText: true,
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
                    child: CustomTextField(
                      textInputType: TextInputType.text,
                      controller: mapController.regionKey,
                      hintText: '  Region'.tr,
                      labelText: '  Region'.tr,
                      isHintColor: true,
                      isLableText: true,
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
              CustomTextField(
                textInputType: TextInputType.text,
                controller: mapController.strKey,
                hintText: '  Street'.tr,
                labelText: '  Street'.tr,
                isHintColor: true,
                isLableText: true,
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
              CustomTextField(
                textInputType: TextInputType.text,
                controller: noteKey,
                hintText: '  Notes'.tr,
                labelText: '  Notes'.tr,
                isHintColor: true,
                isLableText: true,
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
                onPress: () async {
                  if (formKey.currentState!.validate()) {
                    final addressData = AddressData(
                      name: mapController.nameKey.text,
                      city: mapController.cityKey.text,
                      region: mapController.regionKey.text,
                      details: mapController.strKey.text,
                      notes: noteKey.text,
                      latitude: mapController.markerLat.latitude.toString(),
                      longitude: mapController.markerLat.longitude.toString(),
                    );
                    await addressController.addAddress(
                        addressData: addressData, token: token, lang: lanLocal);
                  }
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
