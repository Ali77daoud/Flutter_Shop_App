import 'package:agora_shop/controllers/Auth/auth_controller.dart';
import 'package:agora_shop/routes/routes.dart';
import 'package:agora_shop/shared/constants/color_constants.dart';
import 'package:agora_shop/shared/helpers/extensions/StringExtension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../controllers/Theme/themes_controller.dart';
import '../../shared/widgets/text_widget.dart';
import 'component/account_widget.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final ThemesController _themesController = Get.find<ThemesController>();
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        SliverAppBar(
          expandedHeight: 80.0,
          floating: true,
          backgroundColor:
              Get.isDarkMode ? AppColors.blackLight : AppColors.white,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            titlePadding: const EdgeInsets.symmetric(horizontal: 16),
            title: TextWidget(
                text: 'Settings',
                color: Get.isDarkMode
                    ? AppColors.secondary
                    : AppColors.primaryDark,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
                maxline: 1),
          ),
        ),
        ///////////
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    TextWidget(
                        text: 'Account',
                        color: Get.isDarkMode
                            ? AppColors.secondary
                            : AppColors.primaryDark,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.start,
                        maxline: 1),
                    const SizedBox(height: 16),
                    const AccountWidget(),
                    const SizedBox(height: 32),
                    TextWidget(
                        text: 'Settings',
                        color: Get.isDarkMode
                            ? AppColors.secondary
                            : AppColors.primaryDark,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.start,
                        maxline: 1),
                    const SizedBox(height: 16),
                    GetBuilder<ThemesController>(builder: (_) {
                      return _buildListTile(
                          'Appearance',
                          Icons.dark_mode,
                          _themesController.theme.toCapitalized(),
                          Colors.purple,
                          theme,
                          onTab: () => _showAppearanceModal(
                              theme, _themesController.theme));
                      // return Text(_.theme);
                    }),
                    const SizedBox(height: 8),
                    _buildListTile('Language', Icons.language, 'English',
                        Colors.orange, theme,
                        onTab: () {}),
                    const SizedBox(height: 8),
                    _buildListTile('Notifications',
                        Icons.notifications_outlined, '', Colors.blue, theme,
                        onTab: () {}),
                    _buildListTile('Edit Profile', Icons.person_outline, '',
                        Colors.lime, theme, onTab: () {
                      Get.toNamed(Routes.editProfilePage);
                    }),
                    const SizedBox(height: 8),
                    _buildListTile('Help', Icons.help, '', Colors.green, theme,
                        onTab: () {}),
                    const SizedBox(height: 8),
                    _buildListTile(
                        'Logout', Icons.exit_to_app, '', Colors.red, theme,
                        onTab: () async {
                      await authController.logOut();
                    }),
                  ],
                ),
                Text("Version 1.0.0",
                    style: theme.textTheme.bodyText2
                        ?.copyWith(color: Colors.grey.shade500)),
              ],
            ),
          ),
        )
      ]),
    );
  }

  Widget _buildListTile(
      String title, IconData icon, String trailing, Color color, theme,
      {onTab}) {
    return ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: Container(
          width: 46,
          height: 46,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: color.withAlpha(30)),
          child: Center(
            child: Icon(
              icon,
              color: color,
            ),
          ),
        ),
        title: TextWidget(
            text: title,
            color: Get.isDarkMode ? AppColors.grey : AppColors.primaryDark,
            fontSize: 14,
            fontWeight: FontWeight.normal,
            textAlign: TextAlign.start,
            maxline: 1),
        // Text(title, style: theme.textTheme.subtitle1),
        trailing: SizedBox(
          width: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                  text: trailing,
                  color:
                      Get.isDarkMode ? AppColors.secondary : AppColors.darkGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  textAlign: TextAlign.start,
                  maxline: 1),
              const Icon(
                IconlyBold.arrow_right,
                size: 16,
                color: AppColors.grey,
              ),
            ],
          ),
        ),
        onTap: onTab);
  }

  _showAppearanceModal(ThemeData theme, String current) {
    Get.bottomSheet(Container(
      padding: const EdgeInsets.all(16),
      height: 220,
      decoration: BoxDecoration(
          color: Get.isDarkMode ? Colors.grey.shade900 : Colors.grey.shade200,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
              text: "Select a Theme",
              color:
                  Get.isDarkMode ? AppColors.secondary : AppColors.primaryDark,
              fontSize: 14,
              fontWeight: FontWeight.normal,
              textAlign: TextAlign.start,
              maxline: 1),
          const SizedBox(height: 32),
          ListTile(
            leading: const Icon(
              Icons.brightness_5,
              color: AppColors.primaryLight,
            ),
            title: TextWidget(
                text: "Light",
                color: Get.isDarkMode ? AppColors.grey : AppColors.darkGrey,
                fontSize: 13,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
                maxline: 1),
            onTap: () {
              _themesController.setTheme('light');
              Get.back();
            },
            trailing: Icon(
              IconlyBold.tick_square,
              color: current == 'light'
                  ? AppColors.primaryLight
                  : Colors.transparent,
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(
              Icons.brightness_2,
              color: Colors.orange,
            ),
            title: TextWidget(
                text: "Dark",
                color: Get.isDarkMode ? AppColors.grey : AppColors.darkGrey,
                fontSize: 13,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
                maxline: 1),
            onTap: () {
              _themesController.setTheme('dark');
              Get.back();
            },
            trailing: Icon(
              IconlyBold.tick_square,
              color:
                  current == 'dark' ? AppColors.secondary : Colors.transparent,
            ),
          ),
        ],
      ),
    ));
  }
}
