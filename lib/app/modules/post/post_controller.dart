import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/models/post/post_model.dart';
import 'package:history_hub_v2/app/data/params/post/get_list_post_params.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PostController extends GetxController {
  final AppDatasource datasource;
  PostController(this.datasource);

  @override
  void onInit() {
    pagingController.addPageRequestListener((page) async {
      getListPost(page);
    });

    super.onInit();
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
