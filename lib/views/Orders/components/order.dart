import 'package:agora_shop/controllers/Orders/orders_controller.dart';
import 'package:agora_shop/views/Orders/components/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Orders extends StatelessWidget {
  final OrdersController ordersController = Get.find<OrdersController>();
  Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child:
            CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
          SliverToBoxAdapter(
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: ordersController.ordersData.data.data.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 12,
                    );
                  },
                  itemBuilder: (context, index) {
                    return OrderWidget(
                      total: ordersController.ordersData.data.data[index].total
                          .round()
                          .toString(),
                      status:
                          ordersController.ordersData.data.data[index].status,
                      date: ordersController.ordersData.data.data[index].date,
                      index: index,
                      onTapDetails: () {},
                      onTapCancel: () {},
                    );
                  }))
        ]));
  }
}
