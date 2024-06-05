import 'package:get/get.dart';
import 'package:history_hub_v2/app/modules/auth/login/login_binding.dart';
import 'package:history_hub_v2/app/modules/auth/login/login_page.dart';
import 'package:history_hub_v2/app/modules/auth/register/register_binding.dart';
import 'package:history_hub_v2/app/modules/auth/register/register_page.dart';
import 'package:history_hub_v2/app/modules/auth/register/select_address/select_address_binding.dart';
import 'package:history_hub_v2/app/modules/auth/register/select_address/select_address_page.dart';
import 'package:history_hub_v2/app/modules/event/detail/event_detail_binding.dart';
import 'package:history_hub_v2/app/modules/event/detail/event_detail_page.dart';
import 'package:history_hub_v2/app/modules/home/home_binding.dart';
import 'package:history_hub_v2/app/modules/home/home_page.dart';
import 'package:history_hub_v2/app/modules/profile/profile_binding.dart';
import 'package:history_hub_v2/app/modules/profile/profile_page.dart';
import 'package:history_hub_v2/app/modules/starter/splash/splash_binding.dart';
import 'package:history_hub_v2/app/modules/starter/splash/splash_page.dart';
import 'package:history_hub_v2/app/modules/transaction/payment/payment_binding.dart';
import 'package:history_hub_v2/app/modules/transaction/payment/payment_page.dart';
import 'package:history_hub_v2/app/modules/profile/select_address/select_address_page.dart'
    as profile_page;
import 'package:history_hub_v2/app/modules/profile/select_address/select_address_binding.dart'
    as profile_binding;

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
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RegisterPage.routeName,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: SelectAddressPage.routeName,
      page: () => const SelectAddressPage(),
      binding: SelectAddressBinding(),
    ),
    GetPage(
      name: HomePage.routeName,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: EventDetailPage.routeName,
      page: () => const EventDetailPage(),
      binding: EventDetailBinding(),
    ),
    GetPage(
      name: PaymentPage.routeName,
      page: () => const PaymentPage(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: ProfilePage.routeName,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: profile_page.SelectAddressPage.routeName,
      page: () => const profile_page.SelectAddressPage(),
      binding: profile_binding.SelectAddressBinding(),
    ),
  ];
}
