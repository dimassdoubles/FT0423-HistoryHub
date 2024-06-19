import 'package:flutter/material.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';

class InputNamaEvent extends StatelessWidget {
  final TextEditingController controller;
  const InputNamaEvent(this.controller, {super.key});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      minLines: 1,
      maxLines: 3,
      style: AppTexts.primary.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        hintText: 'Nama Event',
        hintStyle: AppTexts.primary.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: const Color(0xffD1D1D1),
        ),
        border: InputBorder.none,
      ),
    );
  }
}
