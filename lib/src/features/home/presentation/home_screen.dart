import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:history_hub/src/core/styles/app_colors.dart';
import 'package:history_hub/src/core/styles/common_sizes.dart';
import 'package:history_hub/src/features/home/presentation/widgets/post_item.dart';
import 'package:history_hub/src/features/post/presentation/create_post_screen.dart';
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
                  child: TabBarView(
                    children: [
                      ListView.separated(
                        itemCount: 11,
                        itemBuilder: (context, index) => index == 0
                            ? const SizedBox.shrink()
                            : const PostItem(),
                        separatorBuilder: (context, index) => Gap(8.h),
                      ),
                      const Center(
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
              onPressed: () => context.pushNamed(CreatePostScreen.routeName),
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
