import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:history_hub/src/core/constants/styles/app_colors.dart';
import 'package:history_hub/src/core/constants/styles/app_texts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InfoPenyelenggara extends HookConsumerWidget {
  const InfoPenyelenggara({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        SizedBox(
          width: 47.w,
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
              'https://ichef.bbci.co.uk/ace/ws/800/cpsprodpb/cd05/live/7b2cff30-c423-11ee-97bb-5d4fd58ca91c.jpg',
            ),
          ),
        ),
        Gap(4.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Diselenggarakan oleh',
              style: AppTexts.primary.copyWith(
                fontSize: 12.sp,
                color: const Color(0xff8C8C8C),
              ),
            ),
            Text(
              'Nama User',
              style: AppTexts.primary.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
