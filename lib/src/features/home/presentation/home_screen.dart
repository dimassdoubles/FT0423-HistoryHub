import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:history_hub/src/core/styles/common_sizes.dart';
import 'package:history_hub/src/features/home/presentation/widgets/post_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  static const routeName = 'home-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.all(CommonSizes.pagePadding),
      child: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) => const PostItem(),
        separatorBuilder: (context, index) => Gap(8.h),
      ),
    );
  }
}
