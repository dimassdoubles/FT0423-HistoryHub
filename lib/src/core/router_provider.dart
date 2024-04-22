import 'package:go_router/go_router.dart';
import 'package:history_hub/src/features/home/presentation/home_screen.dart';
import 'package:history_hub/src/features/login/presentation/login_screen.dart';
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
  ],
);
