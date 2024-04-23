import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:history_hub/src/features/login/presentation/login_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          context.goNamed(LoginScreen.routeName);
        },
      );
      return null;
    }, []);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/splash_bg.webp',
            width: 1.sw,
            height: 1.sh,
            fit: BoxFit.cover,
          ),
          Center(
            child: Image.asset(
              'assets/images/splash_logo.webp',
              width: 299.w,
            ),
          ),
        ],
      ),
    );
  }
}
