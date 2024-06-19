import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/order_statuses.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';
import 'package:history_hub_v2/app/modules/transaction/widgets/transaction_list_view.dart';

class HomeTransactionView extends GetView<HomeController> {
  const HomeTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: controller.transactionTabController,
          dividerColor: AppColors.neutral200,
          indicatorColor: AppColors.primary500,
          isScrollable: true,
          indicatorWeight: 3,
          tabAlignment: TabAlignment.start,
          labelColor: AppColors.primary500,
          tabs: [
            ...OrderStatuses.values.map(
              (e) => Tab(text: e.label),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: controller.transactionTabController,
            children: [
              ...OrderStatuses.values.map(
                (e) => TransactionListView(e),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
