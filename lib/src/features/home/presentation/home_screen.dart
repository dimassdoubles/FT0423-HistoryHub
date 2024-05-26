import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:history_hub/src/core/router/app_router.gr.dart';
import 'package:history_hub/src/core/constants/styles/app_colors.dart';
import 'package:history_hub/src/core/constants/styles/common_sizes.dart';
import 'package:history_hub/src/features/home/presentation/widgets/post_list_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  static const routeName = 'home-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              onPressed: () => context.pushRoute(const CreatePostRoute()),
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
