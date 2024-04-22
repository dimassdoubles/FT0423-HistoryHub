import 'package:flutter/material.dart';
import 'package:history_hub/src/core/styles/app_colors.dart';
import 'package:history_hub/src/core/widgets/input/input_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppDropdown<ValueType> extends HookConsumerWidget {
  final List<DropdownMenuItem<ValueType>> items;
  final void Function(ValueType?)? onChanged;
  final ValueType? value;
  final String name;
  const AppDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    required this.value,
    required this.name,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButtonFormField<ValueType>(
      value: value,
      items: items,
      onChanged: onChanged,
      style: InputText.textStyle,
      decoration: InputDecoration(
        filled: true,
        hintText: name,
        hintStyle: InputText.textStyle.copyWith(
          color: AppColors.neutral300,
        ),
        border: InputText.border,
        errorBorder: InputText.border,
        enabledBorder: InputText.border,
        focusedBorder: InputText.border,
        disabledBorder: InputText.border,
        focusedErrorBorder: InputText.border,
        fillColor: InputText.fillColor,
      ),
    );
  }
}
