import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:history_hub/src/core/styles/app_colors.dart';
import 'package:history_hub/src/core/styles/app_texts.dart';
import 'package:history_hub/src/core/styles/common_sizes.dart';
import 'package:history_hub/src/core/widgets/input/input_text.dart';
import 'package:history_hub/src/features/photo_editor/presentation/photo_editor_screen.dart';
import 'package:history_hub/src/features/post/presentation/widges/editted_image.dart';
import 'package:history_hub/src/features/post/presentation/widges/input_place.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class CreatePostScreen extends HookConsumerWidget {
  const CreatePostScreen({super.key});

  static const routeName = 'create-post-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useImage = useState<File?>(null);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: CommonSizes.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(CommonSizes.pagePadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => context.pop(),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: const Text(
                      'Batal',
                      style: TextStyle(
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => context.pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary500,
                      foregroundColor: AppColors.white,
                      elevation: 0,
                    ),
                    child: const Text('Post'),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(24.h),
                      TextFormField(
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
                      Gap(16.h),
                      if (useImage.value != null)
                        EdittedImage(
                          useImage.value!,
                          onDelete: () => useImage.value = null,
                        ),
                      const InputPlace(),
                      Gap(16.h),
                      const Divider(color: AppColors.neutral200),
                      if (useImage.value == null)
                        Padding(
                          padding: EdgeInsets.only(top: 6.h),
                          child: ElevatedButton(
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              final (String? err, File? image) =
                                  await showDialog(
                                context: context,
                                builder: (context) => const PhotoEditorScreen(),
                              );

                              if (err != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(err),
                                  ),
                                );
                              } else {
                                useImage.value = image!;
                              }
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
                                  style: AppTexts.primary
                                      .copyWith(color: AppColors.primary500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Gap(CommonSizes.footer),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
