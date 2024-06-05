import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/helpers/image_helper.dart';
import 'package:history_hub_v2/app/modules/profile/profile_controller.dart';

class ButtonEditAvatar extends GetView<ProfileController> {
  const ButtonEditAvatar({super.key});

  static double radius = 32.w;
  static final decoration = BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(
      color: AppColors.neutral100,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        onTap: () {
          ImageHelper.pickImage(
            context: context,
            onImagePicked: (selected) => controller.newProfileImage = selected,
          );
        },
        borderRadius: BorderRadius.circular(1.sw),
        child: Stack(
          children: [
            if (controller.newProfileImage == null)
              Container(
                decoration: decoration,
                child: CircleAvatar(
                  radius: radius,
                  backgroundColor: AppColors.neutral300,
                  backgroundImage: const NetworkImage(
                    'https://www.benarnews.org/indonesian/opini/opini-prabowo-ke-as-10152020224352.html/201015_ID_Prabowo_1000.jpg/@@images/a32d7d84-9c9e-4f74-b00e-b45ea75eb40f.jpeg',
                  ),
                ),
              ),
            if (controller.newProfileImage != null)
              Container(
                decoration: decoration,
                child: CircleAvatar(
                  radius: radius,
                  backgroundColor: AppColors.neutral300,
                  backgroundImage: FileImage(
                    File(controller.newProfileImage!.path),
                  ),
                ),
              ),
            if (controller.newProfileImage == null)
              Container(
                decoration: decoration,
                child: CircleAvatar(
                  radius: radius,
                  backgroundColor: AppColors.black.withOpacity(0.3),
                  child: SvgPicture.asset(
                    'assets/icons/edit_image.svg',
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                    width: 36.w,
                  ),
                ),
              ),
          ],
        ),
      );
    });
  }
}
