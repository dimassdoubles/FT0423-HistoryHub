import 'package:get/get.dart';
import 'package:history_hub_v2/app/modules/auth/login/login_binding.dart';
import 'package:history_hub_v2/app/modules/auth/login/login_page.dart';
import 'package:history_hub_v2/app/modules/auth/register/register_binding.dart';
import 'package:history_hub_v2/app/modules/auth/register/register_page.dart';
import 'package:history_hub_v2/app/modules/home/home_binding.dart';
import 'package:history_hub_v2/app/modules/home/home_page.dart';
import 'package:history_hub_v2/app/modules/starter/splash/splash_binding.dart';
import 'package:history_hub_v2/app/modules/starter/splash/splash_page.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = SplashPage.routeName;

  static final routes = [
    GetPage(
      name: SplashPage.routeName,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: LoginPage.routeName,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RegisterPage.routeName,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: HomePage.routeName,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
