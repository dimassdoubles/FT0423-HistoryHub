import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';
import 'package:history_hub_v2/app/modules/home/widgets/home_drawer.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
        key: controller.sliderDrawerKey,
        appBar: SliderAppBar(
          appBarColor: AppColors.white,
          appBarHeight: 86,
          title: Image.asset(
            'assets/logos/colored_logo.webp',
            width: 36.w,
          ),
          isTitleCenter: true,
        ),
        slider: const HomeDrawer(),
        child: Container(
          color: AppColors.white,
        ),
      ),
    );
  }
}
