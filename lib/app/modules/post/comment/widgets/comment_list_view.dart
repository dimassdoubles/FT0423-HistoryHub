import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/modules/post/comment/comment_controller.dart';

class CommentListView extends GetView<CommentController> {
  const CommentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Daftar Komentar'),
    );
  }
}
