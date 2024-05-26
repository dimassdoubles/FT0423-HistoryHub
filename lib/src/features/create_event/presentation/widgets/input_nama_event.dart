import 'package:flutter/material.dart';
import 'package:history_hub/src/core/constants/styles/app_texts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InputNamaEvent extends HookConsumerWidget {
  const InputNamaEvent({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      style: AppTexts.primary.copyWith(
        fontSize: 24,
      ),
      decoration: InputDecoration(
        hintText: 'Nama Event',
        hintStyle: AppTexts.primary.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: const Color(0xffD1D1D1),
        ),
        border: InputBorder.none,
      ),
    );
  }
}
