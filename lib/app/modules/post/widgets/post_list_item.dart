import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/core/constants/styles/text_weights.dart';
import 'package:history_hub_v2/app/core/extensions/date_time_extension.dart';
import 'package:history_hub_v2/app/data/models/post/post_model.dart';
import 'package:history_hub_v2/app/modules/post/post_controller.dart';
import 'package:photo_view/photo_view.dart';

class PostListItem extends GetView<PostController> {
  final PostModel post;
  const PostListItem(this.post, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.w),
      child: Column(
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
                    post.namaUser,
                    style: AppTexts.primary.copyWith(
                      fontWeight: TextWeights.black,
                      fontSize: 16.sp,
                      color: AppColors.neutral400,
                    ),
                  ),
                  Text(
                    post.tanggal.timeAgo(),
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
          // Chip(
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(100.w),
          //   ),
          //   side: BorderSide.none,
          //   backgroundColor: AppColors.primary100,
          //   avatar: const Icon(
          //     Icons.place_outlined,
          //     color: AppColors.neutral400,
          //   ),
          //   visualDensity: VisualDensity.compact,
          //   padding: EdgeInsets.only(right: 4.w),
          //   label: Text(
          //     'Pati, Jawa Tengah',
          //     style: AppTexts.primary.copyWith(
          //       color: AppColors.neutral400,
          //       fontWeight: TextWeights.medium,
          //       fontSize: 11.sp,
          //     ),
          //   ),
          // ),
          Gap(12.h),
          Text(
            post.content,
            style: AppTexts.primary.copyWith(
              color: AppColors.neutral400,
            ),
          ),
          Gap(16.h),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => Stack(
                  children: [
                    PhotoView(
                      imageProvider: NetworkImage(post.imageUrl),
                    ),
                    IconButton(
                      onPressed: Get.back,
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
            child: SizedBox(
              width: 1.sw,
              height: (3 / 4).sw,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.w),
                child: Image.network(
                  post.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Center(
                      child: Text('Error Image!')), // TODO image error
                ),
              ),
            ),
          ),
          Gap(24.h),
          Row(
            children: [
              SvgPicture.asset('assets/icons/favorite.svg'),
              if (post.likeCount > 0) Text(post.likeCount.toString()),
              Gap(8.w),
              SvgPicture.asset('assets/icons/comment.svg'),
              if (post.commentCount > 0) Text(post.commentCount.toString()),
              Gap(8.w),
              SvgPicture.asset('assets/icons/share.svg'),
              Gap(8.w),
            ],
          ),
          const Divider(
            color: AppColors.neutral200,
          ),
        ],
      ),
    );
  }
}
