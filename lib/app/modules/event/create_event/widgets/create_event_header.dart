import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/modules/event/create_event/widgets/create_event_button.dart';
import 'package:history_hub_v2/app/modules/home/home_page.dart';

class CreateEventHeader extends StatelessWidget {
  final void Function() onSave;
  const CreateEventHeader(this.onSave, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => Get.until(
              (route) => Get.currentRoute == HomePage.routeName,
            ),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            child: const Text(
              'Batal',
              style: TextStyle(
                color: AppColors.black,
              ),
            ),
          ),
          CreateEventButton(onSave),
        ],
      ),
    );
  }
}
