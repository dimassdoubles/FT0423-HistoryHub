import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/modules/starter/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  static const routeName = '/splash';

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
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
