import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/transaction_statuses.dart';
import 'package:history_hub_v2/app/modules/transaction/widgets/transaction_list_item.dart';
import 'package:history_hub_v2/app/presentation/widgets/app_list_view.dart';

import '../transaction_controller.dart';

class TransactionListView extends GetView<TransactionController> {
  final TransactionStatuses status;
  const TransactionListView(this.status, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppListView(
      key: controller.listKey,
      onRefresh: controller.onPageRefresh,
      pagingController: controller.pagingController,
      separator: const SizedBox.shrink(),
      itemBuilder: (context, item, index) => TransactionListItem(item, index),
    );
  }
}
