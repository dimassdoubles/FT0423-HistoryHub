import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:history_hub/src/core/constants/styles/app_colors.dart';
import 'package:history_hub/src/core/constants/styles/common_sizes.dart';
import 'package:history_hub/src/features/post/presentation/controllers/create_post_controller.dart';
import 'package:history_hub/src/features/post/presentation/widgets/add_image_button.dart';
import 'package:history_hub/src/features/post/presentation/widgets/create_post_button.dart';
import 'package:history_hub/src/features/post/presentation/widgets/editted_image.dart';
import 'package:history_hub/src/features/post/presentation/widgets/input_content.dart';
import 'package:history_hub/src/features/post/presentation/widgets/input_place.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class CreatePostScreen extends HookConsumerWidget {
  const CreatePostScreen({super.key});

  static const routeName = 'create-post-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createPostControllerProvider);
    final controller = ref.watch(createPostControllerProvider.notifier);

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
                    onPressed: () => context.back(),
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
                  const CreatePostButton(),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(24.h),
                      const InputContent(),
                      Gap(16.h),
                      if (state.image != null)
                        EdittedImage(
                          state.image!,
                          onDelete: () => controller.removeImage(),
                        ),
                      const InputPlace(),
                      Gap(16.h),
                      const Divider(color: AppColors.neutral200),
                      if (state.image == null) const AddImageButton(),
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
