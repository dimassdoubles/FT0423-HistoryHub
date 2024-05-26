import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:history_hub/src/core/constants/styles/app_colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'create_event_button.dart';

class CreateEventHeader extends HookConsumerWidget {
  const CreateEventHeader({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => context.maybePop(),
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
          const CreateEventButton(),
        ],
      ),
    );
  }
}
