import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:history_hub/src/core/constants/styles/app_colors.dart';
import 'package:history_hub/src/core/constants/styles/app_texts.dart';
import 'package:history_hub/src/core/constants/styles/text_weights.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InputText extends HookConsumerWidget {
  final String name;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final bool obsecureText;
  final bool autoFocus;
  final bool readOnly;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;

  const InputText({
    super.key,
    this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.onFieldSubmitted,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.suffixIcon,
    this.obsecureText = false,
    required this.name,
    this.autoFocus = false,
    this.readOnly = false,
    this.onTap,
    this.inputFormatters,
  });

  static final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.w),
    borderSide: const BorderSide(
      color: AppColors.neutral200,
    ),
  );

  static const fillColor = AppColors.neutral100;
  static const cursorColor = AppColors.primary500;

  static final textStyle = AppTexts.primary.copyWith(
    fontWeight: TextWeights.medium,
    fontSize: 14.sp,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      inputFormatters: inputFormatters,
      readOnly: readOnly,
      autofocus: autoFocus,
      onTap: onTap,
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: (value) {
        onFieldSubmitted?.call(value);
        nextFocusNode?.requestFocus();
      },
      textInputAction: textInputAction,
      validator: validator,
      cursorColor: cursorColor,
      keyboardType: keyboardType,
      style: textStyle.copyWith(color: Colors.black),
      obscureText: obsecureText,
      decoration: InputDecoration(
        hintText: name,
        hintStyle: textStyle.copyWith(color: AppColors.neutral300),
        filled: true,
        fillColor: fillColor,
        focusColor: fillColor,
        hoverColor: fillColor,
        border: border,
        errorBorder: border,
        enabledBorder: border,
        focusedBorder: border,
        disabledBorder: border,
        focusedErrorBorder: border,
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      ),
    );
  }
}
