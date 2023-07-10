import 'package:agora_shop/controllers/OrderDetails.dart/order_details_controller.dart';
import 'package:agora_shop/shared/widgets/check_out_product_widget.dart';
import 'package:agora_shop/views/OrderDetails/components/order_details_widget.dart';
import 'package:agora_shop/views/OrderDetails/components/title_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetails extends StatelessWidget {
  final OrderDetailsController orderDetailsController =
      Get.find<OrderDetailsController>();
  OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, left: 5, top: 0, bottom: 10),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const TitleSectionWidget(
            title: 'General Info',
          ),
          /////////////////////
          generalInfoSection(),
          ////////////////////////////////
          const TitleSectionWidget(
            title: 'Address',
          ),
          /////////////////////
          addressSection(),
          ////////////////////////////////
          const TitleSectionWidget(
            title: 'Products',
          ),
          //////////////////
          productsSection(),
        ],
      ),
    );
  }

  Widget generalInfoSection() {
    return SliverToBoxAdapter(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) {
          if (index == 0) {
            return OrderDetailsWidget(
                title: 'Cost',
                value:
                    '${orderDetailsController.orderDetailsData.data.cost.round()} \$');
          }
          if (index == 1) {
            return OrderDetailsWidget(
                title: 'Vat',
                value:
                    '${orderDetailsController.orderDetailsData.data.vat.round()} \$');
          }
          if (index == 2) {
            return OrderDetailsWidget(
                title: 'Total',
                value:
                    '${orderDetailsController.orderDetailsData.data.total.round()} \$');
          }
          if (index == 3) {
            return OrderDetailsWidget(
                title: 'Payment Method',
                value:
                    orderDetailsController.orderDetailsData.data.paymentMethod);
          }
          if (index == 4) {
            return OrderDetailsWidget(
                title: 'Date',
                value: orderDetailsController.orderDetailsData.data.date);
          }
          if (index == 5) {
            return OrderDetailsWidget(
                title: 'Status',
                value: orderDetailsController.orderDetailsData.data.status);
          }
          return null;
        },
      ),
    );
  }

  Widget addressSection() {
    return SliverToBoxAdapter(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) {
          if (index == 0) {
            return OrderDetailsWidget(
                title: 'Name',
                value:
                    orderDetailsController.orderDetailsData.data.address.name);
          }
          if (index == 1) {
            return OrderDetailsWidget(
                title: 'City',
                value:
                    orderDetailsController.orderDetailsData.data.address.city);
          }
          if (index == 2) {
            return OrderDetailsWidget(
                title: 'Region',
                value: orderDetailsController
                    .orderDetailsData.data.address.region);
          }
          if (index == 3) {
            return OrderDetailsWidget(
                title: 'Street',
                value: orderDetailsController
                    .orderDetailsData.data.address.details);
          }
          return null;
        },
      ),
    );
  }

  Widget productsSection() {
    return SliverToBoxAdapter(
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount:
              orderDetailsController.orderDetailsData.data.products.length,
          itemBuilder: (context, index) {
            return CheckOutProductsWidget(
              img: orderDetailsController
                  .orderDetailsData.data.products[index].image,
              title: orderDetailsController
                  .orderDetailsData.data.products[index].name,
              price: orderDetailsController
                  .orderDetailsData.data.products[index].price
                  .toString(),
              quantity: orderDetailsController
                  .orderDetailsData.data.products[index].quantity
                  .toString(),
            );
          }),
    );
  }
}
