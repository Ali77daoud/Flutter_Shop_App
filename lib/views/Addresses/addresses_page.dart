import 'package:agora_shop/controllers/Address/address_controller.dart';
import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:agora_shop/shared/shared_variables.dart';
import 'package:agora_shop/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'components/add_address_widget.dart';
import 'components/addresses_widget.dart';

class AddressesPage extends StatelessWidget {
  final AddressController addressController = Get.find<AddressController>();
  AddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: customAppBar(
                title: 'Addresses'.tr,
                leading: InkWell(
                  onTap: () {
                    Get.close(1);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Get.isDarkMode
                        ? AppColors.white
                        : AppColors.primaryDark,
                  ),
                ),
                isContainActions: false),
            bottomNavigationBar: const AddAddressWidget(),
            body: GetBuilder<AddressController>(builder: (_) {
              return HandlingErrors.pageErrorHandling(
                isCircleShown: addressController.isGetAddressCircleShown,
                isNoInternetConnection:
                    addressController.isGetAddressNoInternetConnection,
                onTapTry: () async {
                  addressController.getAddressData(
                      lang: lanLocal, token: token);
                },
                page: Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: CustomScrollView(
                            physics: const BouncingScrollPhysics(),
                            slivers: [
                              SliverToBoxAdapter(
                                  child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: addressController
                                          .addressData.data.data.length,
                                      itemBuilder: (context, index) {
                                        return AddressesWidget(
                                          onTap: () {
                                            addressController.chooseAddress(
                                                addressController.addressData
                                                    .data.data[index].id);
                                          },
                                          onDelete: () async {
                                            await addressController
                                                .deleteAddress(
                                                    id: addressController
                                                        .addressData
                                                        .data
                                                        .data[index]
                                                        .id,
                                                    token: token,
                                                    lang: lanLocal);
                                            ////////
                                            if (addressController.addressData
                                                .data.data.isNotEmpty) {
                                              addressController.chooseAddress(
                                                  addressController.addressData
                                                      .data.data[0].id);
                                            } else {
                                              await GetStorage()
                                                  .remove('addressId');
                                            }
                                          },
                                          icon: addressController.addressData
                                                      .data.data[index].id ==
                                                  addressController.currentId
                                              ? Icons.circle
                                              : Icons.circle_outlined,
                                          title: addressController.addressData
                                              .data.data[index].name,
                                          subTitle: addressController
                                              .addressData
                                              .data
                                              .data[index]
                                              .details,
                                          region: addressController.addressData
                                              .data.data[index].region,
                                          id: addressController
                                              .addressData.data.data[index].id,
                                        );
                                      })),
                            ])),
                    addressController.isDeleteAddressCircleShown
                        ? const CircularProgressIndicator()
                        : Container()
                  ],
                ),
              );
            })));
  }
}
