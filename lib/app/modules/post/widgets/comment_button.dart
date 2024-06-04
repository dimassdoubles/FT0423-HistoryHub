import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/core/constants/styles/text_weights.dart';
import 'package:history_hub_v2/app/data/models/post/post_model.dart';
import 'package:history_hub_v2/app/modules/post/post_controller.dart';

class CommentButton extends StatefulWidget {
  final PostModel post;
  final int index;
  const CommentButton(this.post, this.index, {super.key});

  @override
  State<CommentButton> createState() => _CommentButtonState();
}

class _CommentButtonState extends State<CommentButton> {
  final controller = Get.find<PostController>();
  late int commentCount = widget.post.commentCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => controller.commentController.showComment(
            widget.post,
            (newCommentCount) {
              debugPrint('newCommentCount callback: $newCommentCount');
              controller.updateCommentCounter(
                widget.post,
                widget.index,
                newCommentCount,
              );
              setState(() {
                commentCount = newCommentCount;
              });
            },
          ),
          child: SvgPicture.asset(
            'assets/icons/comment.svg',
            colorFilter: const ColorFilter.mode(
              AppColors.neutral400,
              BlendMode.srcIn,
            ),
            height: 20,
          ),
        ),
        if (commentCount > 0)
          Text(
            commentCount.toString(),
            style: AppTexts.primary.copyWith(
              color: const Color.fromARGB(255, 183, 183, 183),
              fontWeight: TextWeights.semiBold,
              fontSize: 12,
            ),
          ),
      ],
    );
  }
}
