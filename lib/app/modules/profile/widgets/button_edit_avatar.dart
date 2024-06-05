import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/helpers/image_helper.dart';
import 'package:history_hub_v2/app/modules/profile/profile_controller.dart';
import 'package:history_hub_v2/app/presentation/widgets/user_avatar.dart';

class ButtonEditAvatar extends GetView<ProfileController> {
  const ButtonEditAvatar({super.key});

  static double radius = 32.w;
  static double size = 75.w;
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
              UserAvatar(controller.userProfile.data!.avatarUrl, size: 75.w),
            if (controller.newProfileImage != null)
              UserAvatar(
                '',
                size: size,
                file: File(controller.newProfileImage!.path),
              ),
            if (controller.newProfileImage == null)
              Container(
                decoration: decoration,
                width: size,
                height: size,
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
