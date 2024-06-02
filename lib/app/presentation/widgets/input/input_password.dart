import 'package:flutter/material.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/presentation/widgets/input/input_text.dart';

class InputPassword extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  const InputPassword({
    super.key,
    this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.textInputAction,
    this.onFieldSubmitted,
  });

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool obsecure = true;

  @override
  Widget build(BuildContext context) {
    return InputText(
      name: 'Password',
      controller: widget.controller,
      focusNode: widget.focusNode,
      nextFocusNode: widget.nextFocusNode,
      keyboardType: TextInputType.emailAddress,
      textInputAction: widget.textInputAction,
      obsecureText: obsecure,
      onFieldSubmitted: widget.onFieldSubmitted,
      suffixIcon: IconButton(
        onPressed: () => setState(() {
          obsecure = !obsecure;
        }),
        icon: Icon(
          obsecure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          color: AppColors.primary500,
        ),
      ),
    );
  }
}
