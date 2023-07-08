import 'package:agora_shop/controllers/CheckOut/checkout_controller.dart';
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
  final CheckOutController checkOutController = Get.find<CheckOutController>();
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
            body: GetBuilder<CheckOutController>(builder: (_) {
              return HandlingErrors.pageErrorHandling(
                isCircleShown: checkOutController.isGetAddressCircleShown,
                isNoInternetConnection:
                    checkOutController.isGetAddressNoInternetConnection,
                onTapTry: () async {
                  checkOutController.getAddressData(
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
                                      itemCount: checkOutController
                                          .addressData.data.data.length,
                                      itemBuilder: (context, index) {
                                        return AddressesWidget(
                                          onTap: () {
                                            checkOutController.chooseAddress(
                                                checkOutController.addressData
                                                    .data.data[index].id);
                                          },
                                          onDelete: () async {
                                            await checkOutController
                                                .deleteAddress(
                                                    id: checkOutController
                                                        .addressData
                                                        .data
                                                        .data[index]
                                                        .id,
                                                    token: token,
                                                    lang: lanLocal);
                                            ////////
                                            if (checkOutController.addressData
                                                .data.data.isNotEmpty) {
                                              checkOutController.chooseAddress(
                                                  checkOutController.addressData
                                                      .data.data[0].id);
                                            } else {
                                              await GetStorage()
                                                  .remove('addressId');
                                            }
                                          },
                                          icon: checkOutController.addressData
                                                      .data.data[index].id ==
                                                  checkOutController
                                                      .addressCurrentId
                                              ? Icons.circle
                                              : Icons.circle_outlined,
                                          title: checkOutController.addressData
                                              .data.data[index].name,
                                          subTitle: checkOutController
                                              .addressData
                                              .data
                                              .data[index]
                                              .details,
                                          region: checkOutController.addressData
                                              .data.data[index].region,
                                          id: checkOutController
                                              .addressData.data.data[index].id,
                                        );
                                      })),
                            ])),
                    checkOutController.isDeleteAddressCircleShown
                        ? const CircularProgressIndicator()
                        : Container()
                  ],
                ),
              );
            })));
  }
}
