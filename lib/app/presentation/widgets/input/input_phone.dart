import 'package:flutter/material.dart';
import 'package:history_hub_v2/app/presentation/widgets/input/input_text.dart';

class InputPhone extends StatelessWidget {
  final Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction? textInputAction;
  const InputPhone({
    super.key,
    this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.textInputAction,
    this.onFieldSubmitted,
  });
  @override
  Widget build(BuildContext context) {
    return InputText(
      name: 'Nomor Hp',
      controller: controller,
      focusNode: focusNode,
      nextFocusNode: nextFocusNode,
      keyboardType: TextInputType.phone,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
