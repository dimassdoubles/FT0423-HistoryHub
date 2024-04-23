import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:history_hub/src/core/styles/app_colors.dart';
import 'package:history_hub/src/core/styles/app_texts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InputPlace extends HookConsumerWidget {
  const InputPlace({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useVisible = useState(true);

    return Container(
      decoration: BoxDecoration(
        color: useVisible.value ? AppColors.primary100 : AppColors.neutral200,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Chip(
            backgroundColor:
                useVisible.value ? AppColors.primary100 : AppColors.neutral200,
            side: BorderSide.none,
            avatar: const Icon(
              Icons.place_outlined,
              color: AppColors.neutral400,
            ),
            label: Text(
              'Grobogan',
              style: AppTexts.primary.copyWith(
                color: AppColors.neutral400,
              ),
            ),
          ),
          Gap(16.w),
          TextButton(
            onPressed: () => useVisible.value = !useVisible.value,
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.w),
              ),
            ),
            child: Text(
              useVisible.value ? 'Sembunyikan' : 'Tampilkan',
              style: AppTexts.primary.copyWith(
                color: AppColors.primary500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
