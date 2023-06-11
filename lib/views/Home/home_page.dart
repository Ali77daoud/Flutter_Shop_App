import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:agora_shop/shared/helpers/screen_size_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/Home/home_controller.dart';
import 'components/category_list.dart';
import 'components/category_title.dart';
import 'components/feed_news.dart';
import 'components/popular_list.dart';
import 'components/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homeController) {
          return HandlingErrors.pageErrorHandling(
              isCircleShown: homeController.isHomeCircleShown,
              isNoInternetConnection: homeController.isHomeNoInternetConnection,
              onTapTry: () {
                print('try');
              },
              page: CustomScrollView(
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
                  const CategoryTitle(title: 'Category', trailingTitle: ''),
                  SliverToBoxAdapter(
                    child: SizedBox(height: getHeightInPercent(context, 2)),
                  ),
                  HomeCategoryList(),
                  SliverToBoxAdapter(
                    child: SizedBox(height: getHeightInPercent(context, 2)),
                  ),
                  const CategoryTitle(title: 'Popular', trailingTitle: ''),
                  SliverToBoxAdapter(
                    child: SizedBox(height: getHeightInPercent(context, 2)),
                  ),
                  HomePopularList(),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 70),
                  ),
                ],
              ));
        });
  }
}
