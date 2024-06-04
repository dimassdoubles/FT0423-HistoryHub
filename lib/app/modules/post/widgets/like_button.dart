import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/core/constants/styles/text_weights.dart';
import 'package:history_hub_v2/app/data/models/post/post_model.dart';
import 'package:history_hub_v2/app/modules/post/post_controller.dart';

class LikeButton extends StatefulWidget {
  final PostModel post;
  final int index;
  const LikeButton(this.post, this.index, {super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  final controller = Get.find<PostController>();
  late bool isLiked = widget.post.isLikedByMe;
  late int likeCount = widget.post.likeCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              likeCount = isLiked ? likeCount - 1 : likeCount + 1;
              isLiked = !isLiked;
            });
            controller.like(widget.post, widget.index, () {
              setState(() {
                isLiked = !isLiked;
                likeCount = isLiked ? likeCount + 1 : likeCount - 1;
              });
            });
          },
          child: SvgPicture.asset(
            isLiked
                ? 'assets/icons/favorite_fill.svg'
                : 'assets/icons/favorite.svg',
            colorFilter: ColorFilter.mode(
              isLiked ? Colors.pink : AppColors.neutral400,
              BlendMode.srcIn,
            ),
            height: 20,
          ),
        ),
        if (likeCount > 0) ...[
          Gap(2.w),
          Text(
            likeCount.toString(),
            style: AppTexts.primary.copyWith(
              color: const Color.fromARGB(255, 183, 183, 183),
              fontWeight: TextWeights.semiBold,
              fontSize: 12,
            ),
          )
        ],
      ],
    );
  }
}
