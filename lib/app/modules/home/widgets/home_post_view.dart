import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/common_sizes.dart';
import 'package:history_hub_v2/app/modules/event/widgets/event_list_view.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';
import 'package:history_hub_v2/app/modules/post/widgets/post_list_view.dart';

class HomePostView extends GetView<HomeController> {
  const HomePostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                dividerColor: AppColors.neutral200,
                indicatorColor: AppColors.primary500,
                isScrollable: true,
                indicatorWeight: 3,
                tabAlignment: TabAlignment.start,
                labelColor: AppColors.primary500,
                tabs: [
                  Tab(text: 'Postingan'),
                  Tab(text: 'Acara'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    PostListView(),
                    EventListView(),
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.all(CommonSizes.pagePadding),
            child: FloatingActionButton(
              onPressed: controller.createPost,
              shape: const CircleBorder(),
              backgroundColor: AppColors.primary500,
              foregroundColor: AppColors.white,
              child: const Icon(Icons.edit_outlined),
            ),
          ),
        ),
      ],
    );
  }
}
