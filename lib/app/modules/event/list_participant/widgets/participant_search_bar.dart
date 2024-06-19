import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/modules/event/list_participant/list_participant_controller.dart';

class ParticipantSearcBar extends GetView<ListParticipantController> {
  static final textStyle = AppTexts.primary.copyWith(
    color: const Color(0xff536470),
  );

  const ParticipantSearcBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: TextFormField(
        controller: controller.queryCtrl,
        cursorColor: AppColors.primary500,
        style: textStyle,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              controller.queryCtrl.clear();
            },
            child: const Icon(Icons.clear_rounded),
          ),
          hintText: 'Cari peserta...',
          fillColor: const Color(0xffDFE6E8),
          filled: true,
          hintStyle: textStyle.copyWith(color: const Color(0xff86A1B3)),
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
