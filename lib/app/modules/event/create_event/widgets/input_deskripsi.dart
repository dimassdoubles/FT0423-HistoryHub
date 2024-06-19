import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/presentation/widgets/input/input_text.dart';

class InputDeskripsi extends StatelessWidget {
  final TextEditingController controller;
  const InputDeskripsi(this.controller, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Deskripsi',
          style: AppTexts.primary.copyWith(
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 119, 119, 119),
          ),
        ),
        TextFormField(
          textInputAction: TextInputAction.next,
          controller: controller,
          maxLength: 400,
          cursorColor: AppColors.primary500,
          minLines: 4,
          maxLines: 5,
          style: InputText.textStyle,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            hintStyle: InputText.textStyle.copyWith(
              fontSize: 16.sp,
              color: AppColors.neutral300,
            ),
            hintText: 'Tulis sesuatu...',
          ),
        ),
      ],
    );
  }
}
