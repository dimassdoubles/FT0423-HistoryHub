import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/models/event/event_model.dart';
import 'package:history_hub_v2/app/data/params/event/get_list_event_params.dart';
import 'package:history_hub_v2/app/modules/event/detail/event_detail_page.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class EventController extends GetxController {
  final AppDatasource datasource;
  EventController(this.datasource);
  @override
  void onInit() {
    pagingController.addPageRequestListener((page) async {
      getListEvent(page);
    });
    super.onInit();
  }

  final listKey = const PageStorageKey("event_list_key");

  Future<void> onPageRefresh() async {
    pagingController.refresh();
  }

  final PagingController<int, EventModel> pagingController = PagingController(
    firstPageKey: 0,
  );

  final pageSize = 10;

  void appendPage(int page, List<EventModel> data) {
    final isLastPage = data.length < pageSize;
    if (isLastPage) {
      pagingController.appendLastPage(data);
    } else {
      pagingController.appendPage(data, page + 1);
    }
  }

  void getListEvent(int page) {
    debugPrint('getListEvent page: $page');

    String? keyword;
    try {
      keyword = Get.find<HomeController>().acaraQuery;
    } catch (_) {}

    datasource
        .getListEvent(
      GetListEventParams(
        keyword: keyword,
        offset: page,
      ),
    )
        .then((value) {
      appendPage(page, value);
    }).catchError((e) {
      pagingController.error = e;
    });
  }

  void goingToDetail(EventModel event) {
    Get.toNamed(
      EventDetailPage.routeName,
      arguments: event,
    );
  }
}
