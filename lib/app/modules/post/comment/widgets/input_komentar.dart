import 'package:flutter/material.dart';
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
          color: const Color.fromARGB(255, 68, 68, 68),
        ),
        decoration: InputDecoration(
          hintText: 'Tambah komentar ...',
          hintStyle: AppTexts.primary.copyWith(
            fontSize: 12,
            color: const Color.fromARGB(255, 163, 162, 162),
          ), // Optional: customize hint text style
          filled: true,
          fillColor: const Color.fromARGB(
              255, 218, 216, 216), // Set the gray background color
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ), // Padding inside the text field
          border: const OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(20)), // Rounded shape
            borderSide: BorderSide.none, // Remove border side
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(20)), // Rounded shape
            borderSide:
                BorderSide.none, // Customize the border color when focused
          ),
        ),
      ),
    );
  }
}
