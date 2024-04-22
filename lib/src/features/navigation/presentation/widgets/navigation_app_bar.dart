import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:history_hub/src/core/styles/common_sizes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavigationAppBar extends HookConsumerWidget
    implements PreferredSizeWidget {
  const NavigationAppBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(CommonSizes.pagePadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(360.w),
              child: CircleAvatar(
                radius: 14.w,
                backgroundImage: const NetworkImage(
                  'https://www.benarnews.org/indonesian/opini/opini-prabowo-ke-as-10152020224352.html/201015_ID_Prabowo_1000.jpg/@@images/a32d7d84-9c9e-4f74-b00e-b45ea75eb40f.jpeg',
                ),
              ),
            ),
            Image.asset(
              'assets/logos/colored_logo.webp',
              width: 28.w,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(64.h);
}
