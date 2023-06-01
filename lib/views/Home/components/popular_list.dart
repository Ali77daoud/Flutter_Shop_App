import 'package:agora_shop/routes/routes.dart';
import 'package:agora_shop/shared/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePopularList extends StatefulWidget {
  const HomePopularList({Key? key}) : super(key: key);

  @override
  State<HomePopularList> createState() => _HomePopularListState();
}

class _HomePopularListState extends State<HomePopularList> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 243.0,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 0.65,
        ),
        delegate: SliverChildBuilderDelegate(
          (ctx, i) {
            return ProductWidget(
              img: 'assets/pictures/popular1.jpg',
              maxPrice: '250',
              minPrice: '200',
              productName: 'Product',
              onTap: () {
                Get.toNamed(Routes.productDetailsPage);
              },
            );
          },
          childCount: 9,
        ),
      ),
    );
  }
}
