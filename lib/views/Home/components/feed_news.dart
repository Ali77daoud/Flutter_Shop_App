import 'package:agora_shop/controllers/Main/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/constants/color_constants.dart';

class FeedNews extends StatelessWidget {
  FeedNews({super.key});
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: buildCarousel(context));
  }

  Widget buildCarousel(context) {
    return SizedBox(
      height: 180,
      child: CarouselSlider.builder(
        carouselController: homeController.carouselController,
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 1.02,
          aspectRatio: 1,
          initialPage: 0,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          onPageChanged: (index, reason) => homeController.changeBanner(index),
        ),
        itemCount: homeController.homeData.data.banners.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            _buildBanner(
                img: homeController.homeData.data.banners[itemIndex].image),
      ),
    );
  }

  Widget _buildBanner({required String img}) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.lightGray,
      ),
      child: CachedNetworkImage(
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(
              value: downloadProgress.progress, strokeWidth: 3),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        imageUrl: img,
        fit: BoxFit.cover,
      ),
    );
  }
}
