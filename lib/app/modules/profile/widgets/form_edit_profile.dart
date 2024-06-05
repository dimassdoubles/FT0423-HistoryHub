import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/core/constants/styles/text_weights.dart';
import 'package:history_hub_v2/app/modules/profile/profile_controller.dart';

class FormEditProfile extends GetView<ProfileController> {
  final String label;
  final TextEditingController? textEditingController;
  final void Function()? onTap;
  const FormEditProfile({
    super.key,
    required this.label,
    this.textEditingController,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 70.w,
              child: Text(
                label,
                style: AppTexts.primary.copyWith(
                  color: const Color.fromARGB(255, 48, 48, 48),
                  fontWeight: TextWeights.black,
                ),
              ),
            ),
            Gap(8.w),
            Expanded(
              child: TextFormField(
                cursorColor: AppColors.primary500,
                controller: textEditingController,
                style: AppTexts.primary.copyWith(
                  color: AppColors.primary500,
                  fontSize: 15.sp,
                ),
                readOnly: onTap != null,
                onTap: onTap,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Tambah $label',
                  hintStyle: AppTexts.primary.copyWith(
                    color: AppColors.neutral300,
                    fontSize: 15.sp,
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ],
        ),
        const Divider(
          color: AppColors.neutral200,
        ),
      ],
    );
  }
}
