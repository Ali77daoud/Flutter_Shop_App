import 'package:agora_shop/controllers/Main/main_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/constants/color_constants.dart';
import '../../../shared/widgets/app_buttons.dart';

class FeedNews extends StatelessWidget {
  FeedNews({super.key});
  final MainController mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: buildCarousel(context));
  }

  Widget buildCarousel(context) {
    return SizedBox(
      height: 180,
      child: CarouselSlider.builder(
        carouselController: mainController.carouselController,
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 1.02,
          aspectRatio: 1,
          initialPage: 0,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          onPageChanged: (index, reason) => mainController.changeBanner(index),
        ),
        itemCount: 3,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            _buildBanner(),
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.grey,
      ),
      child: CachedNetworkImage(
        width: double.infinity,
        imageUrl:
            'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3270&q=80',
        fit: BoxFit.cover,
      ),
    );
  }
}

// class FeedNews extends StatefulWidget {
//   const FeedNews({Key? key}) : super(key: key);

//   @override
//   State<FeedNews> createState() => _FeedNewsState();
// }

// class _FeedNewsState extends State<FeedNews> {
//   int currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return SliverToBoxAdapter(
//       child: Stack(
//         children: [
//           SizedBox(
//             height: 180,
//             child: PageView.builder(
//               physics: const BouncingScrollPhysics(),
//               onPageChanged: (i) {
//                 setState(() => currentIndex = i);
//               },
//               itemCount: 5,
//               itemBuilder: (ctx, i) => Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 10),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(15),
//                   image: DecorationImage(
//                     image: const AssetImage('assets/pictures/clothes_shop.jpg'),
//                     fit: BoxFit.cover,
//                     colorFilter: ColorFilter.mode(
//                       Colors.black.withOpacity(.6),
//                       BlendMode.darken,
//                     ),
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 20),
//                     Container(
//                       height: 35,
//                       width: 130,
//                       alignment: Alignment.center,
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           bottomRight: Radius.circular(15),
//                           topRight: Radius.circular(15),
//                         ),
//                         color: Colors.white24,
//                       ),
//                       child: const Text(
//                         'Special Promo',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     Row(
//                       children: [
//                         const SizedBox(width: 20),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'All menswear',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                               const Text(
//                                 '50% Discount',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const SizedBox(height: 20),
//                               AppButton.normalButton(
//                                 height: 35,
//                                 width: 100,
//                                 title: 'Buy Now',
//                                 backgroundColor: Colors.white,
//                                 shadow: false,
//                                 titleColor: Colors.black,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             right: 30,
//             bottom: 10,
//             child: SizedBox(
//               height: 16,
//               child: Row(
//                 children: List.generate(
//                   5,
//                   (index) => AnimatedContainer(
//                     duration: const Duration(milliseconds: 300),
//                     margin: const EdgeInsets.only(right: 3),
//                     height: index == currentIndex ? 16 : 8,
//                     width: 5,
//                     decoration: BoxDecoration(
//                       color:
//                           index == currentIndex ? Colors.white : AppColors.grey,
//                       borderRadius: BorderRadius.circular(2),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
