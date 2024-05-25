import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:history_hub/src/core/styles/app_colors.dart';
import 'package:history_hub/src/core/styles/app_texts.dart';
import 'package:history_hub/src/core/styles/text_weights.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PrimaryButton extends HookConsumerWidget {
  final VoidCallback onPressed;
  final String name;
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.name,
  });

  static const backgroundColor = AppColors.primary500;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.w),
        ),
        minimumSize: Size.fromHeight(59.w),
        elevation: 0,
      ),
      child: Center(
        child: Text(
          name,
          style: AppTexts.primary.copyWith(
            color: AppColors.white,
            fontSize: 16.sp,
            fontWeight: TextWeights.semiBold,
          ),
        ),
      ),
    );
  }
}
