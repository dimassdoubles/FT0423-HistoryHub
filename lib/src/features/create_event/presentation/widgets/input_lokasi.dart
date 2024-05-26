import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:history_hub/src/core/constants/styles/app_colors.dart';
import 'package:history_hub/src/core/presentation/widgets/input/input_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InputLokasi extends HookConsumerWidget {
  final TextEditingController controller;
  const InputLokasi(this.controller, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      controller: controller,
      maxLength: 400,
      cursorColor: AppColors.primary500,
      minLines: 2,
      maxLines: 3,
      style: InputText.textStyle.copyWith(fontSize: 16.sp),
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        hintStyle: InputText.textStyle.copyWith(
          fontSize: 16.sp,
          color: AppColors.neutral300,
        ),
        hintText: 'Lokasi',
      ),
    );
  }
}
