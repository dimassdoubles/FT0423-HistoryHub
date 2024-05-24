import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:history_hub/src/core/styles/app_colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_view/photo_view.dart';

class EdittedImage extends HookConsumerWidget {
  final File file;
  final VoidCallback? onDelete;
  const EdittedImage(
    this.file, {
    super.key,
    this.onDelete,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      imageProvider: FileImage(file),
                    ),
                    IconButton(
                      onPressed: () {
                        context.back();
                      },
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
                  file,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(4.w),
              child: IconButton(
                onPressed: onDelete,
                style: IconButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: AppColors.black.withOpacity(0.3),
                ),
                icon: const Icon(
                  Icons.delete_outline_rounded,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
