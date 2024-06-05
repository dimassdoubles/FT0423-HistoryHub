import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/core/constants/styles/text_weights.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';

class HomeDrawerMenuItem extends GetView<HomeController> {
  final String label;
  final void Function()? onTap;
  final Widget icon;
  const HomeDrawerMenuItem({
    super.key,
    required this.label,
    this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 12.w),
        color: AppColors.white,
        child: Row(
          children: [
            icon,
            Gap(12.w),
            Text(
              label,
              style: AppTexts.primary.copyWith(
                fontSize: 16.sp,
                fontWeight: TextWeights.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
