import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/transaction_statuses.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/models/order/order_model.dart';
import 'package:history_hub_v2/app/data/params/order/get_list_order_params.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TransactionController extends GetxController {
  final AppDatasource datasource;
  TransactionController(this.datasource);

  @override
  void onInit() {
    pagingController.addPageRequestListener((page) {
      getListOrder(page);
    });
    super.onInit();
  }

  final _transactionStatuses = Rx<TransactionStatuses?>(null);
  TransactionStatuses? get transactionStatuses => _transactionStatuses.value;
  set transactionStatuses(TransactionStatuses? value) {
    _transactionStatuses.value = value;
    onPageRefresh();
  }

  final listKey = const PageStorageKey("list_order_key");

  Future<void> onPageRefresh() async {
    pagingController.refresh();
  }

  final PagingController<int, OrderModel> pagingController = PagingController(
    firstPageKey: 0,
  );

  final pageSize = GetListOrderParams.limit;

  void appendPage(int page, List<OrderModel> data) {
    final isLastPage = data.length < pageSize;
    if (isLastPage) {
      pagingController.appendLastPage(data);
    } else {
      pagingController.appendPage(data, page + 1);
    }
  }

  void getListOrder(int page) {
    debugPrint('getListOrder page: $page');
    datasource
        .getListOrder(
      GetListOrderParams(
        status: transactionStatuses?.toParam().status,
        keyword: '',
        page: page,
      ),
    )
        .then((value) {
      appendPage(page, value);
    }).catchError((e) {
      pagingController.error = e;
    });
  }
}
