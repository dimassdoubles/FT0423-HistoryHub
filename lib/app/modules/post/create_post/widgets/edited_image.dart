import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/modules/photo_editor/presentation/photo_editor_page.dart';
import 'package:history_hub_v2/app/modules/post/create_post/create_post_controller.dart';
import 'package:photo_view/photo_view.dart';

class EdittedImage extends GetView<CreatePostController> {
  const EdittedImage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => Stack(
                  children: [
                    PhotoView(
                      imageProvider: FileImage(controller.selectedImage!),
                    ),
                    IconButton(
                      onPressed: Get.back,
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.black.withOpacity(0.1),
                      ),
                      icon: const Icon(
                        Icons.clear_rounded,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
            borderRadius: BorderRadius.circular(8.w),
            child: SizedBox(
              width: 1.sw,
              height: 1.sw,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.w),
                child: Image.file(
                  controller.selectedImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.toNamed(PhotoEditorPage.routeName, arguments: {
                        'rawImage': controller.selectedImage,
                        'onImageSelected': (image) =>
                            controller.selectedImage = image,
                      });
                    },
                    style: IconButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: AppColors.black.withOpacity(0.3),
                    ),
                    icon: const Icon(
                      Icons.edit_outlined,
                      color: AppColors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.selectedImage = null;
                    },
                    style: IconButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: AppColors.black.withOpacity(0.3),
                    ),
                    icon: const Icon(
                      Icons.delete_outline_rounded,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
