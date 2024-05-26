import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:history_hub/src/core/constants/styles/app_colors.dart';
import 'package:history_hub/src/core/constants/styles/app_texts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailEvent extends HookConsumerWidget {
  final String label;
  final String? value;
  final void Function() onTap;
  const DetailEvent({
    super.key,
    required this.label,
    this.value,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 4.w,
        ),
        child: Text(
          value ?? label,
          style: AppTexts.primary.copyWith(
            fontSize: 14,
            color: value != null ? AppColors.black : const Color(0xff8C8C8C),
          ),
        ),
      ),
    );
  }
}
