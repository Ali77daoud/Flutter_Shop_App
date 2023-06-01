import 'package:flutter/material.dart';

import '../../../shared/constants/color_constants.dart';
import '../../../shared/widgets/text_widget.dart';

class CategoryTitle extends StatelessWidget {
  final String title;
  final String trailingTitle;
  final VoidCallback? onPressMore;

  const CategoryTitle({
    Key? key,
    required this.title,
    required this.trailingTitle,
    this.onPressMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
                text: title,
                color: AppColors.secondary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                maxline: 1),
            InkWell(
              onTap: onPressMore,
              child: TextWidget(
                  text: trailingTitle,
                  color: AppColors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  maxline: 1),
            ),
          ],
        ),
      ),
    );
  }
}
