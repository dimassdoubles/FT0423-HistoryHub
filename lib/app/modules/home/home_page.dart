import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';
import 'package:history_hub_v2/app/modules/home/widgets/app_search_bar.dart';
import 'package:history_hub_v2/app/modules/home/widgets/home_drawer.dart';
import 'package:history_hub_v2/app/modules/home/widgets/home_post_view.dart';
import 'package:history_hub_v2/app/modules/home/widgets/home_transaction_view.dart';

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
        child: Column(
          children: [
            AppSearchBar(),
            Expanded(
              child: Obx(
                () => controller.navBarIndex == 0
                    ? const HomePostView()
                    : const HomeTransactionView(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(
            top: BorderSide(
              color: AppColors.neutral200,
            ),
          ),
        ),
        child: Obx(
          () {
            return BottomNavigationBar(
              backgroundColor: AppColors.white,
              currentIndex: controller.navBarIndex,
              fixedColor: AppColors.primary500,
              selectedLabelStyle: AppTexts.primary.copyWith(fontSize: 0),
              unselectedLabelStyle: AppTexts.primary.copyWith(fontSize: 0),
              onTap: (index) {
                switch (index) {
                  case 0:
                    controller.navBarIndex = 0;
                    break;
                  case 1:
                    controller.navBarIndex = 1;
                    break;
                  default:
                    controller.navBarIndex = 0;
                }
              },
              items: [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: SvgPicture.asset(
                    controller.navBarIndex == 0
                        ? 'assets/icons/home_fill.svg'
                        : 'assets/icons/home.svg',
                    colorFilter: ColorFilter.mode(
                        controller.navBarIndex == 0
                            ? AppColors.primary500
                            : AppColors.neutral300,
                        BlendMode.srcIn),
                    width: controller.navBarIndex == 0 ? 34.w : 32.w,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Transaksi',
                  icon: SvgPicture.asset(
                    controller.navBarIndex == 1
                        ? 'assets/icons/ticket_fill.svg'
                        : 'assets/icons/ticket.svg',
                    colorFilter: ColorFilter.mode(
                        controller.navBarIndex == 1
                            ? AppColors.primary500
                            : AppColors.neutral300,
                        BlendMode.srcIn),
                    width: 30.w,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
