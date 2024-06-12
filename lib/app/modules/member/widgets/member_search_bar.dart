import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';

class MemberSearchBar extends GetView<HomeController> {
  static final textStyle = AppTexts.primary.copyWith(
    color: const Color(0xff536470),
  );

  const MemberSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: TextFormField(
        controller: controller.queryController,
        cursorColor: AppColors.primary500,
        style: textStyle,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              controller.queryController.clear();
            },
            child: const Icon(Icons.clear_rounded),
          ),
          hintText: 'Cari anggota...',
          fillColor: const Color(0xffDFE6E8),
          filled: true,
          hintStyle: textStyle.copyWith(color: Color(0xff86A1B3)),
          contentPadding: EdgeInsets.fromLTRB(16.w, 0.w, 16.w, 16.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
