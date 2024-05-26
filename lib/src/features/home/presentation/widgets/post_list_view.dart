import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:history_hub/src/core/data/models/params/get_post_params.dart';
import 'package:history_hub/src/features/home/presentation/providers/list_post_provider.dart';
import 'package:history_hub/src/features/home/presentation/widgets/post_item.dart';
import 'package:history_hub/src/features/login/presentation/providers/current_user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostListView extends HookConsumerWidget {
  const PostListView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listPost = ref.watch(listPostProvider);

    useEffect(
      () {
        ref.read(listPostProvider.notifier).getPost(
              GetPostParams(
                myUserId: ref.read(currentUserProvider)!.id,
                keyword: "",
                listTagId: [],
                offset: 0,
              ),
            );

        return;
      },
      const [],
    );

    return listPost.when(
      data: (data) {
        return RefreshIndicator(
          onRefresh: () async => ref.invalidate(listPostProvider),
          child: ListView.separated(
            padding: EdgeInsets.only(top: 16.w),
            itemCount: data.length,
            itemBuilder: (context, index) => PostItem(data[index]),
            separatorBuilder: (context, index) => Gap(8.h),
          ),
        );
      },
      error: (error, stackTrace) {
        // TODO component list error
        return Text("Error: ${error.toString()}");
      },
      loading: () {
        // TODO component list loading
        return const Text("Loading");
      },
    );
  }
}
