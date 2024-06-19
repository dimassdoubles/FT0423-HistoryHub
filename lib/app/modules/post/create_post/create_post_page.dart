import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/modules/home/home_page.dart';
import 'package:history_hub_v2/app/modules/post/create_post/widgets/add_image_button.dart';
import 'package:history_hub_v2/app/modules/post/create_post/create_post_controller.dart';
import 'package:history_hub_v2/app/modules/post/create_post/widgets/edited_image.dart';
import 'package:history_hub_v2/app/modules/post/create_post/widgets/input_content.dart';
import 'package:history_hub_v2/app/modules/post/create_post/widgets/create_post_button.dart';

class CreatePostPage extends GetView<CreatePostController> {
  const CreatePostPage({super.key});

  static const routeName = '/create-post';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Get.until(
                        (route) => Get.currentRoute == HomePage.routeName),
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
                  child: Obx(() {
                    debugPrint('selectedImage: ${controller.selectedImage}');
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(24.h),
                        const InputContent(),
                        Gap(16.h),
                        if (controller.selectedImage != null)
                          const EdittedImage(),
                        // const InputPlace(),
                        Gap(16.h),
                        const Divider(color: AppColors.neutral200),
                        if (controller.selectedImage == null)
                          const AddImageButton(),
                        const Gap(68),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
