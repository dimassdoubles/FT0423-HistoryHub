import 'package:flutter/material.dart';
import 'package:history_hub/src/core/widgets/input/input_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InputEmail extends HookConsumerWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction? textInputAction;
  const InputEmail({
    super.key,
    this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.textInputAction,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InputText(
      name: 'Email',
      controller: controller,
      focusNode: focusNode,
      nextFocusNode: nextFocusNode,
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
    );
  }
}
