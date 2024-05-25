import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:history_hub/src/core/router/app_router.gr.dart';
import 'package:history_hub/src/core/styles/app_colors.dart';
import 'package:history_hub/src/core/styles/app_texts.dart';
import 'package:history_hub/src/core/styles/common_sizes.dart';
import 'package:history_hub/src/core/styles/text_weights.dart';
import 'package:history_hub/src/core/widgets/button/primary_button.dart';
import 'package:history_hub/src/core/widgets/input/input_email.dart';
import 'package:history_hub/src/core/widgets/input/input_password.dart';
import 'package:history_hub/src/features/login/presentation/login_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  static const routeName = 'login-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useFocusEmail = useState(FocusNode());
    final useFocusPassword = useState(FocusNode());

    final useCtrlEmail = useTextEditingController();
    final useCtrlPassword = useTextEditingController();

    final controller = ref.read(loginControllerProvider);

    final bottomInsets = MediaQuery.of(context).viewInsets.bottom;
    bool isKeyboardOpen = bottomInsets != 0;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(CommonSizes.pagePadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(0.05.sh),
            if (!isKeyboardOpen)
              Expanded(
                child: SizedBox(
                  width: 1.sw,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 128.w,
                          maxHeight: 130.h,
                        ),
                        child: Image.asset('assets/logos/colored_logo.webp'),
                      ),
                      Gap(24.h),
                      Text(
                        'Welcome to HistoryHub',
                        style: AppTexts.primary.copyWith(
                          fontSize: 24.sp,
                          fontWeight: TextWeights.extraBold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Gap(16.h),
                      Text(
                        'Terhubunglah dan berbagi dengan sesama pecinta sejarah.',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: TextWeights.regular,
                          color: AppColors.neutral400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            Gap(16.h),
            InputEmail(
              focusNode: useFocusEmail.value,
              controller: useCtrlEmail,
              nextFocusNode: useFocusPassword.value,
              textInputAction: TextInputAction.next,
            ),
            Gap(12.h),
            InputPassword(
              focusNode: useFocusPassword.value,
              controller: useCtrlPassword,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => context.pushRoute(const HomeRoute()),
            ),
            Gap(4.h),
            TextButton(
              onPressed: () => context.pushRoute(const ForgotPasswordRoute()),
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.w),
                ),
              ),
              child: Text(
                'Lupa kata sandi?',
                style: AppTexts.primary.copyWith(
                  fontWeight: TextWeights.semiBold,
                  fontSize: 14.sp,
                  color: AppColors.primary500,
                ),
              ),
            ),
            Gap(12.h),
            PrimaryButton(
              onPressed: () async {
                final success = await controller.login(
                  useCtrlEmail.text,
                  useCtrlPassword.text,
                );

                if (success) {
                  // ignore: use_build_context_synchronously
                  context.pushRoute(const HomeRoute());
                }
              },
              name: 'Masuk',
            ),
            Gap(16.h),
            Center(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    'Belum punya akun ?',
                    style: AppTexts.primary.copyWith(
                      color: AppColors.black,
                      fontSize: 14.sp,
                      fontWeight: TextWeights.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.pushRoute(const RegisterRoute()),
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.w),
                      ),
                    ),
                    child: Text(
                      'Daftar di sini',
                      style: AppTexts.primary.copyWith(
                        color: AppColors.primary500,
                        fontSize: 14.sp,
                        fontWeight: TextWeights.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(0.05.sh),
          ],
        ),
      ),
    );
  }
}
