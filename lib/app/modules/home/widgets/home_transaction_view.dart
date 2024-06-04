import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/common_sizes.dart';
import 'package:history_hub_v2/app/core/constants/transaction_statuses.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';
import 'package:history_hub_v2/app/modules/transaction/widgets/transaction_list_view.dart';

class HomeTransactionView extends GetView<HomeController> {
  const HomeTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
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
                ...TransactionStatuses.values.map(
                  (e) => Tab(text: e.label),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: controller.transactionTabController,
                children: [
                  ...TransactionStatuses.values.map(
                    (e) => TransactionListView(e),
                  ),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.all(CommonSizes.pagePadding),
            child: Obx(() {
              return FloatingActionButton(
                onPressed: controller.createPost,
                shape: const CircleBorder(),
                backgroundColor: AppColors.primary500,
                foregroundColor: AppColors.white,
                child: controller.postTabIndex == 0
                    ? const Icon(Icons.edit_outlined)
                    : SvgPicture.asset(
                        'assets/icons/calendar_add.svg',
                        colorFilter: const ColorFilter.mode(
                          AppColors.white,
                          BlendMode.srcIn,
                        ),
                      ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
