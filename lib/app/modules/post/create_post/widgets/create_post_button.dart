// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/modules/post/create_post/create_post_controller.dart';

class CreatePostButton extends GetView<CreatePostController> {
  const CreatePostButton({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: controller.createPost,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary500,
        foregroundColor: AppColors.white,
        elevation: 0,
      ),
      child: const Text('Post'),
    );
  }
}
