import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/core/helpers/image_helper.dart';
import 'package:history_hub_v2/app/modules/photo_editor/presentation/photo_editor_page.dart';
import 'package:history_hub_v2/app/modules/post/create_post/create_post_controller.dart';

class AddImageButton extends GetView<CreatePostController> {
  const AddImageButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 6.h),
      child: ElevatedButton(
        onPressed: () async {
          FocusScope.of(context).unfocus();

          ImageHelper.pickImage(
            context: context,
            onImagePicked: (imagePicked) {
              Get.toNamed(PhotoEditorPage.routeName, arguments: {
                'rawImage': File(imagePicked.path),
                'onImageSelected': (image) => controller.selectedImage = image,
              });
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
