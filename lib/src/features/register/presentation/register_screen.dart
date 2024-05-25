import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:history_hub/src/core/data/models/kabupaten.dart';
import 'package:history_hub/src/core/data/models/kecamatan.dart';
import 'package:history_hub/src/core/data/models/kelurahan.dart';
import 'package:history_hub/src/core/data/models/params/register_user_params.dart';
import 'package:history_hub/src/core/helper/dialog_helper.dart';
import 'package:history_hub/src/core/router/app_router.gr.dart';
import 'package:history_hub/src/core/styles/common_sizes.dart';
import 'package:history_hub/src/core/widgets/button/primary_button.dart';
import 'package:history_hub/src/core/widgets/input/input_email.dart';
import 'package:history_hub/src/core/widgets/input/input_password.dart';
import 'package:history_hub/src/core/widgets/input/input_phone.dart';
import 'package:history_hub/src/core/widgets/input/input_text.dart';
import 'package:history_hub/src/core/widgets/scaffold/app_scaffold.dart';
import 'package:history_hub/src/features/register/presentation/controllers/select_address_controller.dart';
import 'package:history_hub/src/features/register/presentation/register_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
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

    // create controller
    final useCtrlNama = useTextEditingController();
    final useCtrlAlamat = useTextEditingController();
    final useCtrlEmail = useTextEditingController();
    final useCtrlPhone = useTextEditingController();
    final useCtrlPassword = useTextEditingController();

    final useKabupaten = useState<Kabupaten?>(null);
    final useKecamatan = useState<Kecamatan?>(null);
    final useKelurahan = useState<Kelurahan?>(null);

    final controller = ref.read(registerControllerProvider);

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
                    controller: useCtrlNama,
                    focusNode: useFocusNama.value,
                    nextFocusNode: useFocusAlamat.value,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                  Gap(CommonSizes.formGap),
                  InputText(
                    name: 'Alamat',
                    readOnly: true,
                    onTap: () async {
                      final result = await context.router.push(
                        const SelectAddressRoute(),
                      );

                      debugPrint(result.toString());

                      if (result != null) {
                        useKabupaten.value =
                            (result as SelectAddressState).kabupaten;
                        useKecamatan.value = result.kecamatan;
                        useKelurahan.value = result.kelurahan;
                        useCtrlAlamat.text =
                            "Kab. ${result.kabupaten!.nama}, Kec. ${result.kecamatan!.nama}, Kel. ${result.kelurahan!.nama}";
                      }
                    },
                    controller: useCtrlAlamat,
                    focusNode: useFocusAlamat.value,
                    nextFocusNode: useFocusEmail.value,
                    textInputAction: TextInputAction.next,
                  ),
                  Gap(CommonSizes.formGap),
                  InputEmail(
                    controller: useCtrlEmail,
                    focusNode: useFocusEmail.value,
                    nextFocusNode: useFocusPhone.value,
                    textInputAction: TextInputAction.next,
                  ),
                  Gap(CommonSizes.formGap),
                  InputPhone(
                    controller: useCtrlPhone,
                    focusNode: useFocusPhone.value,
                    nextFocusNode: useFocusPassword.value,
                    textInputAction: TextInputAction.next,
                  ),
                  Gap(CommonSizes.formGap),
                  InputPassword(
                    controller: useCtrlPassword,
                    focusNode: useFocusPassword.value,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) =>
                        context.router.push(const LoginRoute()),
                  ),
                ],
              ),
            ),
          ),
          Gap(16.h),
          PrimaryButton(
            onPressed: () async {
              final success = await controller.registerUser(
                RegisterUserParams(
                  password: useCtrlPassword.text,
                  fullName: useCtrlNama.text,
                  phoneNumber: useCtrlPhone.text,
                  // TODO uncomment
                  // address: useCtrlAlamat.text,
                  address: 'alamat',
                  email: useCtrlEmail.text,
                ),
              );

              if (success) {
                DialogHelper.showSuccess(
                  'Berhasil mendaftar, silahkan cek email anda untuk verifikasi akun.',
                );

                // ignore: use_build_context_synchronously
                context.router.push(const LoginRoute());
              }
            },
            name: 'Daftar',
          ),
        ],
      ),
    );
  }
}
