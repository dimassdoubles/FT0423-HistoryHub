import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/common_sizes.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';
import 'package:history_hub_v2/app/modules/post/widgets/post_list_view.dart';

class HomePostView extends GetView<HomeController> {
  const HomePostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const TabBar(
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
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: CommonSizes.pagePadding),
                  child: const TabBarView(
                    children: [
                      PostListView(),
                      Center(
                        child: Text('Acara'),
                      ),
                    ],
                  ),
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
