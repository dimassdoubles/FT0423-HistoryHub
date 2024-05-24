import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:history_hub/src/core/router/app_router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          context.pushRoute(const LoginRoute());
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
