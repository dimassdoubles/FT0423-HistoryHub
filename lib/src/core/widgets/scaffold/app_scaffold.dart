import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:history_hub/src/core/styles/app_colors.dart';
import 'package:history_hub/src/core/styles/common_sizes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppScaffold extends HookConsumerWidget {
  final String? title;
  final Widget? body;
  final bool useDefaultPadding;
  const AppScaffold({
    super.key,
    this.title,
    this.body,
    this.useDefaultPadding = true,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: title != null ? Text(title!) : null,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.h),
          child: const Divider(
            color: AppColors.neutral200,
          ),
        ),
      ),
      body: useDefaultPadding
          ? Padding(
              padding: EdgeInsets.all(CommonSizes.pagePadding),
              child: body,
            )
          : body,
    );
  }
}
