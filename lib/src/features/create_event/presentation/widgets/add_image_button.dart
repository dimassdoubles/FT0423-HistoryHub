import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:history_hub/src/core/constants/styles/app_colors.dart';
import 'package:history_hub/src/core/constants/styles/app_texts.dart';
import 'package:history_hub/src/core/helper/image_helper.dart';
import 'package:history_hub/src/features/create_event/presentation/providers/create_event_image_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddImageButton extends HookConsumerWidget {
  const AddImageButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(createEventImageProvider);

    return InkWell(
      onTap: image == null
          ? () {
              ImageHelper.pickImage(
                context: context,
                onImagePicked: (imagePicked) {
                  ref.read(createEventImageProvider.notifier).set(
                        File(imagePicked.path),
                      );
                },
              );
            }
          : null,
      child: Container(
        width: 1.sw,
        height: (1 / 2).sw,
        decoration: const BoxDecoration(
          color: Color(0xffF1F7FF),
        ),
        child: image != null
            ? Stack(
                children: [
                  Image.file(
                    image,
                    fit: BoxFit.cover,
                    width: 1.sw,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(4.w),
                      child: IconButton(
                        onPressed: () {
                          ref.read(createEventImageProvider.notifier).set(null);
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
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/add-image.png',
                    width: 55.w,
                  ),
                  Text(
                    'Unggah gambar/poster/banner',
                    style: AppTexts.primary.copyWith(
                      fontSize: 14,
                      color: const Color(0xff8C8C8C),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
