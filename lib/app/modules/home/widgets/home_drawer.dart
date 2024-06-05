import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/core/constants/styles/common_sizes.dart';
import 'package:history_hub_v2/app/core/constants/styles/text_weights.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';
import 'package:history_hub_v2/app/modules/home/widgets/home_drawer_menu_item.dart';
import 'package:history_hub_v2/app/modules/profile/profile_page.dart';

class HomeDrawer extends GetView<HomeController> {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: EdgeInsets.all(CommonSizes.pagePadding),
        decoration: const BoxDecoration(
            color: AppColors.white,
            border: Border(
              right: BorderSide(
                color: AppColors.neutral200,
              ),
            )),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(
                    ProfilePage.routeName,
                    arguments: controller.currentUser!.id,
                  );
                },
                child: Container(
                  color: AppColors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 16.w,
                        backgroundColor: AppColors.neutral300,
                        backgroundImage: const NetworkImage(
                          'https://www.benarnews.org/indonesian/opini/opini-prabowo-ke-as-10152020224352.html/201015_ID_Prabowo_1000.jpg/@@images/a32d7d84-9c9e-4f74-b00e-b45ea75eb40f.jpeg',
                        ),
                      ),
                      Gap(8.w),
                      Text(
                        controller.currentUser!.fullName,
                        style: AppTexts.primary.copyWith(
                          fontSize: 15,
                          fontWeight: TextWeights.black,
                        ),
                      ),
                      Text(
                        controller.currentUser!.email,
                        style: AppTexts.primary.copyWith(
                          fontSize: 12,
                          color: AppColors.neutral400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Gap(24.w),
                    HomeDrawerMenuItem(
                      label: 'Profile',
                      onTap: () {
                        Get.toNamed(
                          ProfilePage.routeName,
                          arguments: controller.currentUser!.id,
                        );
                      },
                      icon: const Icon(
                        Icons.person_outline_rounded,
                        color: AppColors.neutral400,
                        size: 21,
                      ),
                    ),
                    const HomeDrawerMenuItem(
                      label: 'Disukai',
                      icon: Icon(
                        Icons.favorite_outline_rounded,
                        color: AppColors.neutral400,
                        size: 21,
                      ),
                    ),
                  ],
                ),
              ),
              HomeDrawerMenuItem(
                label: 'Keluar',
                onTap: controller.logout,
                icon: const Icon(
                  Icons.logout,
                  color: AppColors.neutral400,
                  size: 21,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
