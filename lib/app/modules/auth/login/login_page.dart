import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/core/constants/styles/common_sizes.dart';
import 'package:history_hub_v2/app/core/constants/styles/text_weights.dart';
import 'package:history_hub_v2/app/modules/auth/login/login_controller.dart';
import 'package:history_hub_v2/app/presentation/widgets/button/primary_button.dart';
import 'package:history_hub_v2/app/presentation/widgets/input/input_email.dart';
import 'package:history_hub_v2/app/presentation/widgets/input/input_password.dart';

class LoginPage extends GetView<LoginController> {
  static const routeName = "/login";

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: EdgeInsets.all(CommonSizes.pagePadding),
          child: LayoutBuilder(builder: (context, constraint) {
            controller.checkIsKeyboardOpen();
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(0.05.sh),
                if (!controller.isKeyboardOpen)
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
                            child:
                                Image.asset('assets/logos/colored_logo.webp'),
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
                if (controller.isKeyboardOpen) Gap(16.h),
                InputEmail(
                  focusNode: controller.focusEmail,
                  controller: controller.controllerEmail,
                  nextFocusNode: controller.focusPassword,
                  textInputAction: TextInputAction.next,
                ),
                Gap(12.h),
                InputPassword(
                  focusNode: controller.focusPassword,
                  controller: controller.controllerPassword,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => controller.login(),
                ),
                Gap(4.h),
                if (false)
                  // ignore: dead_code
                  TextButton(
                    onPressed: controller.forgotPassword,
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
                Gap(36.h), // TODO set to 12
                PrimaryButton(
                  onPressed: controller.login,
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
                        onPressed: controller.register,
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
            );
          }),
        ),
      ),
    );
  }
}
