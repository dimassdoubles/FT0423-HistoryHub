import 'package:go_router/go_router.dart';
import 'package:history_hub/src/features/forgot_password/presentation/forgot_password_screen.dart';
import 'package:history_hub/src/features/home/presentation/home_screen.dart';
import 'package:history_hub/src/features/login/presentation/login_screen.dart';
import 'package:history_hub/src/features/register/presentation/register_screen.dart';
import 'package:history_hub/src/features/register/presentation/select_address_screen.dart';
import 'package:history_hub/src/features/splash_screen.dart';

final GoRouter routerProvider = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      name: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      name: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/forgot-password',
      name: ForgotPasswordScreen.routeName,
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: '/register',
      name: RegisterScreen.routeName,
      builder: (context, state) => const RegisterScreen(),
      routes: [
        GoRoute(
          path: 'select-address',
          name: SelectAddressScreen.routeName,
          builder: (context, state) => const SelectAddressScreen(),
        ),
      ],
    ),
  ],
);
