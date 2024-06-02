import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/core/constants/styles/text_weights.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';

class HomeDrawerMenuItem extends GetView<HomeController> {
  final String label;
  final void Function()? onTap;
  final Widget icon;
  const HomeDrawerMenuItem({
    super.key,
    required this.label,
    this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: icon,
      title: Text(
        label,
        style: AppTexts.primary.copyWith(
          fontWeight: TextWeights.black,
        ),
      ),
    );
  }
}
