import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:history_hub/src/core/styles/app_colors.dart';
import 'package:history_hub/src/core/styles/app_texts.dart';
import 'package:history_hub/src/core/styles/common_sizes.dart';
import 'package:history_hub/src/core/styles/text_weights.dart';
import 'package:history_hub/src/core/widgets/button/primary_button.dart';
import 'package:history_hub/src/core/widgets/input/input_email.dart';
import 'package:history_hub/src/features/login/presentation/login_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ForgotPasswordScreen extends HookConsumerWidget {
  const ForgotPasswordScreen({super.key});

  static const routeName = 'forgot-password-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useEmailCtrl = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.h),
          child: const Divider(
            color: AppColors.neutral200,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(CommonSizes.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lupa kata sandi?',
                    style: AppTexts.primary.copyWith(
                      fontWeight: TextWeights.bold,
                      fontSize: 24.sp,
                    ),
                  ),
                  Gap(12.h),
                  Text(
                    'Silahkan masukan email anda, kami akan mengirimkan tautan untuk memperbarui sandi anda',
                    style: AppTexts.primary.copyWith(
                      color: AppColors.neutral400,
                    ),
                  ),
                  Gap(24.h),
                  InputEmail(
                    controller: useEmailCtrl,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) =>
                        context.goNamed(LoginScreen.routeName),
                  ),
                ],
              ),
            ),
            PrimaryButton(
              onPressed: () => context.goNamed(LoginScreen.routeName),
              name: 'Kirim',
            ),
          ],
        ),
      ),
    );
  }
}
