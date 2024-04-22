import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:history_hub/src/core/widgets/input/input_email.dart';
import 'package:history_hub/src/core/widgets/input/input_password.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  static const routeName = 'home-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useFocusEmail = useState(FocusNode());
    final useFocusPassword = useState(FocusNode());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputEmail(
              focusNode: useFocusEmail.value,
              nextFocusNode: useFocusPassword.value,
              textInputAction: TextInputAction.next,
            ),
            Gap(12.h),
            InputPassword(
              focusNode: useFocusPassword.value,
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
      ),
    );
  }
}
