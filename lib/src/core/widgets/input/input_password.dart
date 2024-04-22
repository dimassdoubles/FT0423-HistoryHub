import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:history_hub/src/core/styles/app_colors.dart';
import 'package:history_hub/src/core/widgets/input/input_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InputPassword extends HookConsumerWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction? textInputAction;
  const InputPassword({
    super.key,
    this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.textInputAction,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useObsecure = useState(true);

    return InputText(
      name: 'Password',
      controller: controller,
      focusNode: focusNode,
      nextFocusNode: nextFocusNode,
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      obsecureText: useObsecure.value,
      suffixIcon: IconButton(
        onPressed: () => useObsecure.value = !useObsecure.value,
        icon: Icon(
          useObsecure.value
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: AppColors.primary500,
        ),
      ),
    );
  }
}
