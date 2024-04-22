import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:history_hub/src/core/styles/common_sizes.dart';
import 'package:history_hub/src/core/widgets/button/primary_button.dart';
import 'package:history_hub/src/core/widgets/input/input_email.dart';
import 'package:history_hub/src/core/widgets/input/input_password.dart';
import 'package:history_hub/src/core/widgets/input/input_phone.dart';
import 'package:history_hub/src/core/widgets/input/input_text.dart';
import 'package:history_hub/src/core/widgets/scaffold/app_scaffold.dart';
import 'package:history_hub/src/features/login/presentation/login_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterScreen extends HookConsumerWidget {
  const RegisterScreen({super.key});

  static const routeName = 'register-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useFocusNama = useState(FocusNode());
    final useFocusAlamat = useState(FocusNode());
    final useFocusEmail = useState(FocusNode());
    final useFocusPhone = useState(FocusNode());
    final useFocusPassword = useState(FocusNode());

    return AppScaffold(
      title: 'Buat akun baru',
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InputText(
                    name: 'Nama',
                    focusNode: useFocusNama.value,
                    nextFocusNode: useFocusAlamat.value,
                    textInputAction: TextInputAction.next,
                  ),
                  Gap(CommonSizes.formGap),
                  InputText(
                    name: 'Alamat',
                    focusNode: useFocusAlamat.value,
                    nextFocusNode: useFocusEmail.value,
                    textInputAction: TextInputAction.next,
                  ),
                  Gap(CommonSizes.formGap),
                  InputEmail(
                    focusNode: useFocusEmail.value,
                    nextFocusNode: useFocusPhone.value,
                    textInputAction: TextInputAction.next,
                  ),
                  Gap(CommonSizes.formGap),
                  InputPhone(
                    focusNode: useFocusPhone.value,
                    nextFocusNode: useFocusPassword.value,
                    textInputAction: TextInputAction.next,
                  ),
                  Gap(CommonSizes.formGap),
                  InputPassword(
                    focusNode: useFocusPassword.value,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) =>
                        context.goNamed(LoginScreen.routeName),
                  ),
                ],
              ),
            ),
          ),
          Gap(16.h),
          PrimaryButton(
            onPressed: () => context.goNamed(LoginScreen.routeName),
            name: 'Daftar',
          ),
        ],
      ),
    );
  }
}
