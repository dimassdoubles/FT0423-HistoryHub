import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';

class DetailEvent extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 4.w,
        ),
        child: Text(
          value ?? label,
          style: AppTexts.primary.copyWith(
            color: value != null ? AppColors.black : const Color(0xff8C8C8C),
          ),
        ),
      ),
    );
  }
}
