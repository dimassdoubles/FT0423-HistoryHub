import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/core/constants/styles/text_weights.dart';
import 'package:history_hub_v2/app/data/models/post/post_model.dart';
import 'package:history_hub_v2/app/modules/post/comment/comment_controller.dart';

class InputKomentar extends GetView<CommentController> {
  final PostModel post;
  const InputKomentar(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextFormField(
              controller: controller.controllerKomentar,
              onFieldSubmitted: (value) => controller.comment(post, value),
              cursorColor: AppColors.primary500,
              minLines: 1,
              maxLines: 2,
              textInputAction: TextInputAction.send,
              style: AppTexts.primary.copyWith(
                fontWeight: TextWeights.semiBold,
                fontSize: 12,
                color: const Color(0xff536470),
              ),
              decoration: InputDecoration(
                hintText: 'Tambah komentar ...',
                hintStyle: AppTexts.primary.copyWith(
                  fontSize: 12,
                  color: const Color(0xff536470),
                ), // Optional: customize hint text style
                filled: true,
                fillColor:
                    const Color(0xffEFF3F4), // Set the gray background color
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ), // Padding inside the text field
                border: const OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(20)), // Rounded shape
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(20)), // Rounded shape
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Gap(4.w),
          SizedBox(
            height: 45,
            child: FloatingActionButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                controller.comment(post, controller.controllerKomentar.text);
              },
              backgroundColor: AppColors.primary500,
              foregroundColor: Colors.white,
              shape: const CircleBorder(),
              child: const Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }
}
