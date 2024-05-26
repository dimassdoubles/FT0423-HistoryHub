import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:history_hub/src/core/helper/image_helper.dart';
import 'package:history_hub/src/core/styles/app_colors.dart';
import 'package:history_hub/src/core/styles/app_texts.dart';
import 'package:history_hub/src/features/photo_editor/presentation/photo_editor_screen.dart';
import 'package:history_hub/src/features/post/presentation/controllers/create_post_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddImageButton extends HookConsumerWidget {
  const AddImageButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(createPostControllerProvider.notifier);

    return Padding(
      padding: EdgeInsets.only(top: 6.h),
      child: ElevatedButton(
        onPressed: () async {
          FocusScope.of(context).unfocus();
          ImageHelper.pickImage(
            context: context,
            onImagePicked: (imagePicked) {
              showDialog(
                context: context,
                builder: (context) => PhotoEditorScreen(
                  rawImage: File(imagePicked.path),
                  onImageSelected: (image) => controller.setImage(image),
                ),
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary100,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.w),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.image_outlined,
              color: AppColors.primary500,
            ),
            Gap(4.w),
            Text(
              'Foto',
              style: AppTexts.primary.copyWith(color: AppColors.primary500),
            ),
          ],
        ),
      ),
    );
  }
}
