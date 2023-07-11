import 'package:agora_shop/shared/helpers/screen_size_utils.dart';
import 'package:flutter/material.dart';

class ItemAnimationWidget extends StatelessWidget {
  final Widget child;
  final bool isStartAnimation;
  final int index;
  const ItemAnimationWidget(
      {super.key,
      required this.child,
      required this.isStartAnimation,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 300 + (index * 200)),
        transform: Matrix4.translationValues(
            isStartAnimation ? 0 : getWidthInPercent(context, 100), 0, 0),
        child: child);
  }
}
