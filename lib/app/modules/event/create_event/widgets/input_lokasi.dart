import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/presentation/widgets/input/input_text.dart';

class InputLokasi extends StatelessWidget {
  final TextEditingController controller;
  const InputLokasi(this.controller, {super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          'assets/icons/place.svg',
          colorFilter: const ColorFilter.mode(
            AppColors.black,
            BlendMode.srcIn,
          ),
        ),
        Gap(8.w),
        Expanded(
          child: TextFormField(
            textInputAction: TextInputAction.next,
            controller: controller,
            cursorColor: AppColors.primary500,
            minLines: 2,
            maxLines: 3,
            style: InputText.textStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              hintStyle: InputText.textStyle.copyWith(
                color: const Color(0xff8C8C8C),
              ),
              hintText: 'Lokasi',
            ),
          ),
        ),
      ],
    );
  }
}
