import 'package:flutter/material.dart';
import 'components/favourite_item.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const FavouriteItem();
      },
      itemCount: 5,
    );
  }
}
