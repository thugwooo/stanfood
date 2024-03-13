import 'package:get/get.dart';
import 'package:stanfood/app_binding.dart';
import 'package:stanfood/routes/app_routes.dart';
import 'package:stanfood/screens/home/home_view.dart';
import 'package:stanfood/screens/login/sign_in_view.dart';
import 'package:stanfood/screens/register/register_view.dart';
import 'package:stanfood/screens/splash_view.dart';

import '../app.dart';

class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.app,
      page: () => App(),
      binding: AppBinding(),
    ),
    GetPage(
      name: Routes.splash,
      page: () => SplashView(),
    ),
    GetPage(
      name: Routes.signIn,
      page: () => SignInView(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeView(),
    ),
    GetPage(
      name: Routes.register,
      page: () => RegisterView(),
    ),
  ];
}
