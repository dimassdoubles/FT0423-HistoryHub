import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/models/post/comment_model.dart';
import 'package:history_hub_v2/app/data/models/post/post_model.dart';
import 'package:history_hub_v2/app/data/models/result_model.dart';

import 'widgets/comment_bottom_sheet.dart';

class CommentController extends GetxController {
  final AppDatasource datasource;
  CommentController(this.datasource);

  final controllerKomentar = TextEditingController();

  final _commentCounter = 0.obs;
  int get commentCounter => _commentCounter.value;
  set commentCounter(int value) => _commentCounter.value = value;

  void showComment(
    PostModel post,
    void Function(int commentCounter) commentCounterUpdate,
  ) async {
    getListComment(post);
    await Get.bottomSheet(
      CommentBottomSheet(post),
      backgroundColor: const Color(0xffFFFFFF),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
    );

    commentCounterUpdate.call(commentCounter);
  }

  void comment(PostModel post, String comment) {
    controllerKomentar.clear();
    if (comment.isNotEmpty) {
      datasource.comment(post.id, comment).then((value) {
        getListComment(post);
      });
    }
  }

  final _listComment = ResultModel<List<CommentModel>?>.initial().obs;
  ResultModel<List<CommentModel>?> get listComment => _listComment.value;
  set listComment(ResultModel<List<CommentModel>?> value) =>
      _listComment.value = value;

  void getListComment(PostModel post) {
    listComment = ResultModel.loading();
    datasource.geListComment(post.id).then((value) {
      listComment = ResultModel.success(value);
      commentCounter = value.length;
    }).catchError((e) {
      listComment = ResultModel.error(e);
    });
  }
}
