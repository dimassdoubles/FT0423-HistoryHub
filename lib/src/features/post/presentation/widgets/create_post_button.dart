import 'package:flutter/material.dart';
import 'package:history_hub/src/core/styles/app_colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreatePostButton extends HookConsumerWidget {
  const CreatePostButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary500,
        foregroundColor: AppColors.white,
        elevation: 0,
      ),
      child: const Text('Post'),
    );
  }
}
