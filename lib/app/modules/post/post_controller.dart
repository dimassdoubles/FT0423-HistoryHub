import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/models/post/post_model.dart';
import 'package:history_hub_v2/app/data/params/post/get_list_post_params.dart';
import 'package:history_hub_v2/app/modules/post/comment/comment_controller.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PostController extends GetxController {
  final AppDatasource datasource;
  final CommentController commentController;
  PostController(this.datasource, this.commentController);

  @override
  void onInit() {
    pagingController.addPageRequestListener((page) async {
      getListPost(page);
    });

    super.onInit();
  }

  // jika sudah like otomatis unlike
  void like(PostModel post, int index, void Function()? onError) {
    pagingController.itemList![index] = post.copyWith(
        isLikedByMe: !post.isLikedByMe,
        likeCount: post.isLikedByMe ? post.likeCount - 1 : post.likeCount + 1);
    debugPrint('liked: ${pagingController.itemList![index].isLikedByMe}');
    datasource.like(post.id).catchError((e) {
      pagingController.itemList![index] = post;
      debugPrint(
        'unliked bcs error: ${pagingController.itemList![index].isLikedByMe}',
      );
      onError?.call();
    });
  }

  final listKey = const PageStorageKey("list_post_key");

  Future<void> onPageRefresh() async {
    pagingController.refresh();
  }

  final PagingController<int, PostModel> pagingController = PagingController(
    firstPageKey: 0,
  );

  final pageSize = GetListPostParams.limit;

  void appendPage(int page, List<PostModel> data) {
    final isLastPage = data.length < pageSize;
    if (isLastPage) {
      pagingController.appendLastPage(data);
    } else {
      pagingController.appendPage(data, page + 1);
    }
  }

  void getListPost(int page) {
    debugPrint('getListPost page: $page');
    datasource
        .getListPost(
      GetListPostParams(
        keyword: '',
        listTagId: [],
        offset: page,
      ),
    )
        .then((value) {
      appendPage(page, value);
    }).catchError((e) {
      pagingController.error = e;
    });
  }

  
}
