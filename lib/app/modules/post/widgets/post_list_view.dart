import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/modules/post/post_controller.dart';
import 'package:history_hub_v2/app/modules/post/widgets/post_list_item.dart';
import 'package:history_hub_v2/app/presentation/widgets/app_list_view.dart';

class PostListView extends GetView<PostController> {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppListView(
      key: controller.listKey,
      onRefresh: controller.onPageRefresh,
      pagingController: controller.pagingController,
      itemBuilder: (context, item, index) => PostListItem(item),
    );
  }
}
