import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/helpers/dialog_helper.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/models/post/post_model.dart';
import 'package:history_hub_v2/app/data/params/post/get_list_post_params.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';
import 'package:history_hub_v2/app/modules/home/home_page.dart';
import 'package:history_hub_v2/app/modules/post/comment/comment_controller.dart';
import 'package:history_hub_v2/app/modules/profile/profile_controller.dart';
import 'package:history_hub_v2/app/modules/profile/profile_page.dart';
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

    getListTrends();

    super.onInit();
  }

  final listTrends = <String>[].obs;

  void getListTrends() {
    listTrends.value = [];
    datasource.getListTrends().then((value) {
      debugPrint('getListTrends berhasil');
      debugPrint('getListTrends lenght : ${value.length}');
      listTrends.value = value;
    }).catchError((e) {
      DialogHelper.showError(e.toString());
    });
  }

  void removePinned() {
    DialogHelper.showLoading();
    datasource.removePinned().then((value) {
      DialogHelper.dismiss();
      DialogHelper.showSuccess('Berhasil menghapus sematan postingan');
      onPageRefresh();
    }).catchError((e) {
      DialogHelper.dismiss();
      DialogHelper.showError(
          'Gagal menghapus sematan postingan: ${e.toString()}');
    });
  }

  void pinNewPost(String postId) {
    DialogHelper.showLoading();
    datasource.pinNewPost(postId).then((value) {
      DialogHelper.dismiss();
      DialogHelper.showSuccess('Berhasil menyematkan postingan');
      onPageRefresh();
    }).catchError((e) {
      DialogHelper.dismiss();
      DialogHelper.showError('Gagal menyematkan postingan: ${e.toString()}');
    });
  }

  void deletePost(String postId) {
    DialogHelper.showLoading();
    datasource.deletePost(postId).then((value) {
      DialogHelper.dismiss();
      DialogHelper.showSuccess('Berhasil menghapus postingan');
      onPageRefresh();
    }).catchError((e) {
      DialogHelper.dismiss();
      DialogHelper.showError('Gagal menghapus postingan: ${e.toString()}');
    });
  }

  int curPage = -1;

  void updateCommentCounter(PostModel post, int index, int newCommentCount) {
    pagingController.itemList![index] = post.copyWith(
      commentCount: newCommentCount,
    );
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
    debugPrint('Post Controller on page refresh');
    curPage = -1;
    pagingController.refresh();
    getListTrends();
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

  void getListPost(int page) async {
    if (curPage == page) {
      return;
    } else {
      curPage = page;
    }

    String? userId;
    String? keyword;

    if (Get.currentRoute == ProfilePage.routeName) {
      try {
        userId = Get.find<ProfileController>().userId;
      } catch (_) {}
    }

    if (Get.currentRoute == HomePage.routeName) {
      try {
        keyword = Get.find<HomeController>().postinganQuery;
      } catch (_) {}
    }

    PostModel? pinnedPost;

    if (page == 0 && userId == null) {
      try {
        pinnedPost = await datasource.getPinnedPost();
      } catch (e) {
        pagingController.error = e;
      }
    }

    debugPrint('getListPost page: $page');
    datasource
        .getListPost(
      GetListPostParams(
        userId: userId,
        keyword: keyword,
        listTagId: [],
        offset: page,
      ),
    )
        .then((value) {
      debugPrint('pinned post: ${pinnedPost?.content}');
      debugPrint(
          '${(pinnedPost != null ? [pinnedPost, ...value] : value).length}');
      appendPage(page, pinnedPost != null ? [pinnedPost, ...value] : value);
    }).catchError((e) {
      pagingController.error = Exception(e.toString());
    });
  }
}
