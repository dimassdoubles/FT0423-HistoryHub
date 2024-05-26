import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:history_hub/src/core/constants/styles/app_colors.dart';
import 'package:history_hub/src/core/presentation/widgets/input/input_text.dart';
import 'package:history_hub/src/features/post/presentation/controllers/create_post_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InputContent extends HookConsumerWidget {
  const InputContent({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useContent = useTextEditingController();
    final controller = ref.watch(createPostControllerProvider.notifier);

    return TextFormField(
      controller: useContent,
      maxLength: 400,
      cursorColor: AppColors.primary500,
      minLines: 4,
      maxLines: 5,
      style: InputText.textStyle,
      onChanged: (value) => controller.setContent(value),
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
