import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:history_hub/src/features/forgot_password/presentation/forgot_password_screen.dart';
import 'package:history_hub/src/features/home/presentation/home_screen.dart';
import 'package:history_hub/src/features/login/presentation/login_screen.dart';
import 'package:history_hub/src/features/navigation/presentation/navigation_screen.dart';
import 'package:history_hub/src/features/register/presentation/register_screen.dart';
import 'package:history_hub/src/features/register/presentation/select_address_screen.dart';
import 'package:history_hub/src/features/splash_screen.dart';
import 'package:history_hub/src/features/transaction/presentation/transaction_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final GoRouter routerProvider = GoRouter(
  initialLocation: '/splash',
  navigatorKey: _rootNavigatorKey,
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
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => NavigationScreen(
        body: child,
      ),
      routes: [
        GoRoute(
          path: '/home',
          name: HomeScreen.routeName,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/transaksi',
          name: TransactionScreen.routeName,
          builder: (context, state) => const TransactionScreen(),
        ),
      ],
    ),
  ],
);
