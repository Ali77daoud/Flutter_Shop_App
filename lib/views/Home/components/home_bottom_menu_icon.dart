import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/constants/color_constants.dart';

BottomNavigationBarItem homeBottomMenuIcon({
  required final int itemIndex,
  required final int currentIndex,
  required final String title,
  required final String svgPic,
}) {
  return BottomNavigationBarItem(
    label: title,
    icon: Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SvgPicture.asset(
        svgPic,
        height: 22,
        width: 22,
        color: currentIndex == itemIndex
            ? AppColors.darkGrey
            : AppColors.lightGray,
      ),
    ),
  );
}
