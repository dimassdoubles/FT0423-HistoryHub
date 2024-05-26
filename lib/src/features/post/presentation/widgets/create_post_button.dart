// ignore_for_file: unused_import

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:history_hub/src/core/data/models/app_result.dart';
import 'package:history_hub/src/core/helper/dialog_helper.dart';
import 'package:history_hub/src/core/router/app_router.gr.dart';
import 'package:history_hub/src/core/constants/styles/app_colors.dart';
import 'package:history_hub/src/features/login/presentation/providers/current_user_provider.dart';
import 'package:history_hub/src/features/post/presentation/controllers/create_post_controller.dart';
import 'package:history_hub/src/features/post/presentation/providers/create_post_status_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreatePostButton extends HookConsumerWidget {
  const CreatePostButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.read(currentUserProvider);

    ref.listen(createPostStatusProvider, (previous, next) {
      if (next.$2 == ResultStatus.loading) {
        DialogHelper.showLoading();
      } else if (next.$2 == ResultStatus.success) {
        DialogHelper.dismiss();
        DialogHelper.showSuccess('Berhasil membuat postingan');
        context.router
            .popUntil((route) => route.settings.name == NavigationRoute.name);
      } else if (next.$2 == ResultStatus.error) {
        DialogHelper.dismiss();
        DialogHelper.showError(
          'Gagal membuat postingan: ${next.$2.toString()}',
        );
      }
    });

    return ElevatedButton(
      onPressed: () {
        ref
            .read(createPostControllerProvider.notifier)
            .createPost(currentUser!.id);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary500,
        foregroundColor: AppColors.white,
        elevation: 0,
      ),
      child: const Text('Post'),
    );
  }
}
