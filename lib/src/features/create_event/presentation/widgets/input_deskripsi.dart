import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:history_hub/src/core/constants/styles/app_colors.dart';
import 'package:history_hub/src/core/constants/styles/app_texts.dart';
import 'package:history_hub/src/core/presentation/widgets/input/input_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InputDeskripsi extends HookConsumerWidget {
  final TextEditingController controller;
  const InputDeskripsi(this.controller, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            'Deskripsi',
            style: AppTexts.primary.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          maxLength: 400,
          cursorColor: AppColors.primary500,
          minLines: 4,
          maxLines: 5,
          style: InputText.textStyle,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 8.w,
            ),
            hintStyle: InputText.textStyle.copyWith(
              color: AppColors.neutral300,
            ),
            hintText: 'Tulis sesuatu...',
          ),
        ),
      ],
    );
  }
}
