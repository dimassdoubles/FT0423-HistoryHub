import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/core/constants/styles/text_weights.dart';
import 'package:history_hub_v2/app/modules/profile/profile_controller.dart';
import 'package:history_hub_v2/app/modules/profile/widgets/button_edit_profile.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                color: const Color.fromARGB(255, 135, 181, 228),
                width: 1.sw,
                height: 150.w,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.all(4.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.black.withOpacity(0.5),
                            ),
                            child: const Icon(
                              Icons.arrow_back_rounded,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.translate(
                  offset: const Offset(0, -24),
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 32.w,
                      backgroundColor: AppColors.neutral300,
                      backgroundImage: const NetworkImage(
                        'https://www.benarnews.org/indonesian/opini/opini-prabowo-ke-as-10152020224352.html/201015_ID_Prabowo_1000.jpg/@@images/a32d7d84-9c9e-4f74-b00e-b45ea75eb40f.jpeg',
                      ),
                    ),
                  ),
                ),
                const ButtonEditProfile(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: const Offset(0, -10),
                  child: Text(
                    'Dimas Saputro',
                    style: AppTexts.primary.copyWith(
                      fontWeight: TextWeights.black,
                    ),
                  ),
                ),
                Text(
                  'dimas@gmail.com',
                  style: AppTexts.primary.copyWith(
                    color: AppColors.neutral400,
                  ),
                ),
                Text(
                  '0812345678',
                  style: AppTexts.primary.copyWith(
                    color: AppColors.neutral400,
                  ),
                ),
                Text(
                  'Jawa Tengah, Indonesia',
                  style: AppTexts.primary.copyWith(
                    color: AppColors.neutral400,
                  ),
                ),
              ],
            ),
          ),
          Gap(8.w),
          const Divider(
            color: AppColors.neutral200,
          ),
          Gap(16.w),
          Expanded(
            child: Column(),
          ),
        ],
      ),
    );
  }
}
