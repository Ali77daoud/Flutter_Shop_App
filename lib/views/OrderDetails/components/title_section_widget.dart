import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';

class TitleSectionWidget extends StatelessWidget {
  final String title;
  const TitleSectionWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        height: 48,
        color: AppColors.lightGray,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          child: TextWidget(
              text: title,
              color: AppColors.primaryDark,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.start,
              maxline: 1),
        ),
      ),
    );
  }
}
