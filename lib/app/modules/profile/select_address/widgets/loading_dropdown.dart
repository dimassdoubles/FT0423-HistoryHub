import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/presentation/widgets/input/input_text.dart';

class LoadingDropdown extends StatelessWidget {
  final String name;
  const LoadingDropdown(this.name,{super.key});

  @override
  Widget build(BuildContext context) {
    return InputText(
      name: name,
      readOnly: true,
      suffixIcon: Padding(
        padding: EdgeInsets.only(right: 8.w),
        child: Transform.scale(
          scale: 0.5,
          child: CircularProgressIndicator(
            strokeWidth: 6.w,
            color: AppColors.primary500,
          ),
        ),
      ),
    );
  }
}
