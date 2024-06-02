import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/common_sizes.dart';

class AppScaffold extends StatelessWidget {
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
  Widget build(BuildContext context) {
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
