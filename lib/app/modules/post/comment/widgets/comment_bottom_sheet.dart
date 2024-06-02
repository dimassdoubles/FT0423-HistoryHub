import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/core/constants/styles/text_weights.dart';
import 'package:history_hub_v2/app/data/models/post/post_model.dart';
import 'package:history_hub_v2/app/modules/post/comment/comment_controller.dart';
import 'package:history_hub_v2/app/modules/post/comment/widgets/input_komentar.dart';

import 'comment_list_view.dart';

class CommentBottomSheet extends GetView<CommentController> {
  final PostModel post;
  const CommentBottomSheet(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(16.w),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '12 Komentar',
                style: AppTexts.primary.copyWith(
                  fontSize: 12.sp,
                  fontWeight: TextWeights.bold,
                ),
              ),
              IconButton(
                onPressed: Get.back,
                icon: const Icon(Icons.clear),
              ),
            ],
          ),
        ),
        Gap(8.w),
        const Expanded(
          child: CommentListView(),
        ),
        InputKomentar(post),
      ],
    );
  }
}
