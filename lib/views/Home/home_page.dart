import 'package:agora_shop/shared/helpers/screen_size_utils.dart';
import 'package:flutter/material.dart';
import 'components/category_list.dart';
import 'components/category_title.dart';
import 'components/feed_news.dart';
import 'components/popular_list.dart';
import 'components/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: getHeightInPercent(context, 2)),
        ),
        const SearchBar(),
        SliverToBoxAdapter(
          child: SizedBox(height: getHeightInPercent(context, 2)),
        ),
        FeedNews(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: getHeightInPercent(context, 2),
          ),
        ),
        const CategoryTitle(title: 'Category', trailingTitle: 'View All'),
        SliverToBoxAdapter(
          child: SizedBox(height: getHeightInPercent(context, 2)),
        ),
        const HomeCategoryList(),
        SliverToBoxAdapter(
          child: SizedBox(height: getHeightInPercent(context, 2)),
        ),
        const CategoryTitle(title: 'Popular', trailingTitle: 'View All'),
        SliverToBoxAdapter(
          child: SizedBox(height: getHeightInPercent(context, 2)),
        ),
        const HomePopularList(),
        const SliverToBoxAdapter(
          child: SizedBox(height: 70),
        ),
      ],
    );
  }
}
