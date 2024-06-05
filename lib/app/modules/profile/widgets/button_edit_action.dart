import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/modules/profile/profile_controller.dart';

class ButtonEditAction extends GetView<ProfileController> {
  final void Function()? onTap;
  final String label;
  const ButtonEditAction({
    super.key,
    this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary500,
      ),
      child: Text(label),
    );
  }
}
