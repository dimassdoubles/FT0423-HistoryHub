import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/models/post/post_model.dart';

import 'widgets/comment_bottom_sheet.dart';

class CommentController extends GetxController {
  final AppDatasource datasource;
  CommentController(this.datasource);

  void showComment(PostModel post) {
    Get.bottomSheet(
      CommentBottomSheet(post),
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
    );
  }

  void comment(PostModel post, String comment) {
    if (comment.isNotEmpty) {
      datasource.comment(post.id, comment);
    }
  }
}
