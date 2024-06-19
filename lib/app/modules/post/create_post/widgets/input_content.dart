import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/modules/post/create_post/create_post_controller.dart';
import 'package:history_hub_v2/app/presentation/widgets/input/input_text.dart';

class InputContent extends GetView<CreatePostController> {
  const InputContent({super.key});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.contentController,
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
    );
  }
}
