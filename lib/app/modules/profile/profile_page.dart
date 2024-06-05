import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/core/constants/styles/text_weights.dart';
import 'package:history_hub_v2/app/data/models/result_model.dart';
import 'package:history_hub_v2/app/modules/profile/profile_controller.dart';
import 'package:history_hub_v2/app/modules/profile/widgets/button_edit_profile.dart';
import 'package:history_hub_v2/app/presentation/widgets/user_avatar.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Obx(() {
        final status = controller.userProfile.status;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  color: status == ResultStatus.success
                      ? const Color.fromARGB(255, 118, 118, 118)
                      : AppColors.white,
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
            if (status == ResultStatus.loading)
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary500,
                  ),
                ),
              ),
            if (status == ResultStatus.success) ...[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.translate(
                      offset: const Offset(0, -24),
                      child: UserAvatar(
                        controller.userProfile.data!.avatarUrl,
                        size: 75.w,
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
                        controller.userProfile.data!.name,
                        style: AppTexts.primary.copyWith(
                          fontWeight: TextWeights.black,
                        ),
                      ),
                    ),
                    Text(
                      controller.userProfile.data!.email,
                      style: AppTexts.primary.copyWith(
                        color: AppColors.neutral400,
                      ),
                    ),
                    Text(
                      controller.userProfile.data!.telepon,
                      style: AppTexts.primary.copyWith(
                        color: AppColors.neutral400,
                      ),
                    ),
                    Text(
                      controller.userProfile.data!.alamatText,
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
              const Expanded(
                child: Column(),
              ),
            ],
          ],
        );
      }),
    );
  }
}
