import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/core/constants/styles/text_weights.dart';
import 'package:history_hub_v2/app/modules/profile/profile_controller.dart';
import 'package:history_hub_v2/app/modules/profile/widgets/edit_profile_dialog.dart';

class ButtonEditProfile extends GetView<ProfileController> {
  const ButtonEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -10),
      child: InkWell(
        onTap: () {
          controller.resetEditState();
          Get.bottomSheet(
            const EditProfilePage(),
            persistent: false,
            isScrollControlled: true,
            ignoreSafeArea: false,
          );
        },
        borderRadius: BorderRadius.circular(100.w),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 4.w,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(100.w),
            border: Border.all(
              color: AppColors.neutral300,
            ),
          ),
          child: Text(
            'Edit profil',
            style: AppTexts.primary.copyWith(
              fontSize: 12.sp,
              fontWeight: TextWeights.extraBold,
              color: const Color.fromARGB(255, 62, 62, 62),
            ),
          ),
        ),
      ),
    );
  }
}
