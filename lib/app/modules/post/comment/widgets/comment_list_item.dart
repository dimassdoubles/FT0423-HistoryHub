import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/core/constants/styles/text_weights.dart';
import 'package:history_hub_v2/app/core/extensions/date_time_extension.dart';
import 'package:history_hub_v2/app/data/models/post/comment_model.dart';

class CommentListItem extends StatelessWidget {
  final CommentModel data;
  const CommentListItem(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO avatar user
          SizedBox(
            width: 36.w,
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://ichef.bbci.co.uk/ace/ws/800/cpsprodpb/cd05/live/7b2cff30-c423-11ee-97bb-5d4fd58ca91c.jpg',
              ),
            ),
          ),
          Gap(8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.userName,
                  style: AppTexts.primary.copyWith(
                    fontSize: 10,
                    fontWeight: TextWeights.bold,
                    color: const Color.fromARGB(255, 151, 151, 151),
                  ),
                ),
                Gap(4.w),
                Text(
                  data.content,
                  style: AppTexts.primary.copyWith(
                    fontSize: 13,
                    fontWeight: TextWeights.bold,
                    color: const Color.fromARGB(255, 58, 58, 58),
                  ),
                ),
                Gap(4.w),
                Text(
                  data.createdAt.timeAgo(),
                  style: AppTexts.primary.copyWith(
                    fontSize: 10,
                    fontWeight: TextWeights.semiBold,
                    color: AppColors.neutral300,
                  ),
                ),
                Gap(16.w),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
