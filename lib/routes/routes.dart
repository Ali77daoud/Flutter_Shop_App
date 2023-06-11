import 'package:agora_shop/controllers/Auth/auth_binding.dart';
import 'package:agora_shop/controllers/Main/main_binding.dart';
import 'package:agora_shop/controllers/ProductDetails/product_details_binding.dart';
import 'package:agora_shop/views/Auth/signup_page.dart';
import 'package:agora_shop/views/Welcome/welcome_screen.dart';
import 'package:get/get.dart';
import '../views/Auth/login_page.dart';
import '../views/Main/main_page.dart';
import '../views/ProductDetails/detail_page.dart';
import '../views/Welcome/splash_page.dart';

class Routes {
  static const splashPage = '/splashPage';
  static const welcomePage = '/welcomePage';
  static const loginPage = '/loginPage';
  static const signUpPage = '/signUpPage';
  static const mainPage = '/mainPage';
  static const productDetailsPage = '/productDetailsPage';
}

class AppRoutes {
  static final routes = [
    GetPage(
      name: Routes.splashPage,
      page: () => const SplashPage(),
    ),
    ////
    GetPage(
      name: Routes.welcomePage,
      page: () => const WelcomePage(),
    ),
    //////Auth/////////////////////////////
    GetPage(
      name: Routes.signUpPage,
      page: () => SignUpPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 800),
    ),
    ////////////////////////
    GetPage(
      name: Routes.loginPage,
      page: () => LoginPage(),
      binding: AuthBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 800),
    ),

    /// app route //////////////////////////////
    GetPage(
      name: Routes.mainPage,
      page: () => MainPage(),
      binding: MainBinding(),
      transitionDuration: const Duration(milliseconds: 0),
    ),

    /// ///////////////////////
    GetPage(
      name: Routes.productDetailsPage,
      page: () => DetailPage(),
      binding: ProductDetailsBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 200),
    ),
  ];
}
