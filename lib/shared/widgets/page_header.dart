// import 'package:agora_shop/shared/constants/color_constants.dart';
// import 'package:agora_shop/shared/widgets/text_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class PageHeader extends StatelessWidget {
//   final String pageTitle;
//   final Function()? onTap;
//   const PageHeader({super.key, required this.pageTitle, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return SliverToBoxAdapter(
//       child: Row(
//         children: [
//           InkWell(
//             onTap: onTap,
//             child: Icon(
//               Icons.arrow_back_ios,
//               color: Get.isDarkMode ? AppColors.white : AppColors.primaryDark,
//             ),
//           ),
//           Expanded(
//             child: TextWidget(
//                 text: pageTitle.tr,
//                 color: Get.isDarkMode ? AppColors.white : AppColors.primaryDark,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 textAlign: TextAlign.center,
//                 maxline: 1),
//           ),
//         ],
//       ),
//     );
//   }
// }
