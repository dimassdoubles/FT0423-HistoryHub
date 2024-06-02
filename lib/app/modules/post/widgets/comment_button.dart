import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/data/models/post/post_model.dart';
import 'package:history_hub_v2/app/modules/post/post_controller.dart';

class CommentButton extends GetView<PostController> {
  final PostModel post;
  const CommentButton(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => controller.commentController.showComment(post),
          child: SvgPicture.asset(
            'assets/icons/comment.svg',
            colorFilter: const ColorFilter.mode(
              AppColors.neutral400,
              BlendMode.srcIn,
            ),
          ),
        ),
        if (post.commentCount > 0)
          Text(
            post.commentCount.toString(),
          ),
      ],
    );
  }
}
