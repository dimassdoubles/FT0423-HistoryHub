import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/common_sizes.dart';
import 'package:history_hub_v2/app/modules/auth/register/register_controller.dart';
import 'package:history_hub_v2/app/presentation/widgets/button/primary_button.dart';
import 'package:history_hub_v2/app/presentation/widgets/input/input_email.dart';
import 'package:history_hub_v2/app/presentation/widgets/input/input_password.dart';
import 'package:history_hub_v2/app/presentation/widgets/input/input_phone.dart';
import 'package:history_hub_v2/app/presentation/widgets/input/input_text.dart';
import 'package:history_hub_v2/app/presentation/widgets/scaffold/app_scaffold.dart';

class RegisterPage extends GetView<RegisterController> {
  static const routeName = '/register';

  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Buat akun baru',
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InputText(
                      name: 'Nama',
                      controller: controller.controllerNama,
                      focusNode: controller.focusNama,
                      nextFocusNode: controller.focusAlamat,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ),
                    Gap(CommonSizes.formGap),
                    InputText(
                      name: 'Alamat',
                      readOnly: true,
                      onTap: controller.selectAddress,
                      controller: controller.controllerAlamat,
                      focusNode: controller.focusAlamat,
                      nextFocusNode: controller.focusEmail,
                      textInputAction: TextInputAction.next,
                    ),
                    Gap(CommonSizes.formGap),
                    InputEmail(
                      controller: controller.controllerEmail,
                      focusNode: controller.focusEmail,
                      nextFocusNode: controller.focusPhone,
                      textInputAction: TextInputAction.next,
                    ),
                    Gap(CommonSizes.formGap),
                    InputPhone(
                      controller: controller.controllerPhone,
                      focusNode: controller.focusPhone,
                      nextFocusNode: controller.focusPassword,
                      textInputAction: TextInputAction.next,
                    ),
                    Gap(CommonSizes.formGap),
                    InputPassword(
                      controller: controller.controllerPassword,
                      focusNode: controller.focusPassword,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => controller.register(),
                    ),
                  ],
                ),
              ),
            ),
            Gap(16.h),
            PrimaryButton(
              onPressed: controller.register,
              name: 'Daftar',
            ),
          ],
        ),
      ),
    );
  }
}
