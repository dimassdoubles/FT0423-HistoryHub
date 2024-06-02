import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/data/models/post/post_model.dart';
import 'package:history_hub_v2/app/data/models/result_model.dart';
import 'package:history_hub_v2/app/modules/post/comment/comment_controller.dart';

import 'comment_list_item.dart';

class CommentListView extends GetView<CommentController> {
  final PostModel post;
  const CommentListView(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final status = controller.listComment.status;
        if (status == ResultStatus.success) {
          final data = controller.listComment.data!;
          return RefreshIndicator(
            color: AppColors.primary500,
            onRefresh: () async => controller.getListComment(post),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (_, index) => CommentListItem(data[index]),
            ),
          );
        } else if (status == ResultStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary500,
            ),
          );
        } else if (status == ResultStatus.error) {
          return Center(
            child: Text(controller.listComment.error!.toString()),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
