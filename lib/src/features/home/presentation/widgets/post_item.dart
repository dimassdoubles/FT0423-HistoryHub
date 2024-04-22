import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:history_hub/src/core/styles/app_colors.dart';
import 'package:history_hub/src/core/styles/app_texts.dart';
import 'package:history_hub/src/core/styles/text_weights.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_view/photo_view.dart';

class PostItem extends HookConsumerWidget {
  const PostItem({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
                  'Joko Widodo',
                  style: AppTexts.primary.copyWith(
                    fontWeight: TextWeights.black,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  '5j yang lalu',
                  style: AppTexts.primary.copyWith(
                    fontSize: 10,
                    fontWeight: TextWeights.semiBold,
                    color: AppColors.neutral300,
                  ),
                ),
              ],
            ),
          ],
        ),
        Gap(8.w),
        Chip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.w),
          ),
          side: BorderSide.none,
          backgroundColor: AppColors.primary100,
          avatar: const Icon(
            Icons.place_outlined,
            color: AppColors.neutral400,
          ),
          visualDensity: VisualDensity.compact,
          padding: EdgeInsets.only(right: 4.w),
          label: Text(
            'Pati, Jawa Tengah',
            style: AppTexts.primary.copyWith(
              color: AppColors.neutral400,
              fontWeight: TextWeights.medium,
              fontSize: 11.sp,
            ),
          ),
        ),
        Gap(12.h),
        Text(
          'Pada abad ke-19, Revolusi Industri mengubah wajah peradaban manusia secara mendalam. Inovasi teknologi, seperti mesin uap dan jalur kereta api, mempercepat perkembangan industri dan memicu perubahan sosial yang signifikan.',
          style: AppTexts.primary,
        ),
        Gap(16.h),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => Stack(
                children: [
                  PhotoView(
                    imageProvider: const NetworkImage(
                      'https://img.inews.co.id/media/600/files/networks/2022/11/17/00876_kapal-uap-voc.jpg',
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.black.withOpacity(0.1),
                    ),
                    icon: const Icon(
                      Icons.clear_rounded,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.w),
            child: Image.network(
              'https://img.inews.co.id/media/600/files/networks/2022/11/17/00876_kapal-uap-voc.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Gap(24.h),
        Row(
          children: [
            SvgPicture.asset('assets/icons/favorite.svg'),
            Gap(8.w),
            SvgPicture.asset('assets/icons/comment.svg'),
            Gap(8.w),
            SvgPicture.asset('assets/icons/share.svg'),
            Gap(8.w),
          ],
        ),
        const Divider(
          color: AppColors.neutral200,
        ),
      ],
    );
  }
}
