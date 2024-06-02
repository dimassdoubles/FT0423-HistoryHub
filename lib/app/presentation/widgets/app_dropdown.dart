import 'package:flutter/material.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/presentation/widgets/input/input_text.dart';

class AppDropdown<ValueType> extends StatelessWidget {
  final List<DropdownMenuItem<ValueType>> items;
  final void Function(ValueType?)? onChanged;
  final ValueType? value;
  final String name;
  final bool isRequired;
  const AppDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    required this.value,
    required this.name,
    this.isRequired = true,
  });
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<ValueType>(
      value: value,
      items: items,
      onChanged: onChanged,
      style: InputText.textStyle,
      validator: (value) {
        if (isRequired && value == null) {
          return "$name harus diisi";
        }
        return null;
      },
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
