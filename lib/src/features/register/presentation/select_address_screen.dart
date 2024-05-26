import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:history_hub/src/core/constants/styles/common_sizes.dart';
import 'package:history_hub/src/core/presentation/widgets/button/primary_button.dart';
import 'package:history_hub/src/core/presentation/widgets/scaffold/app_scaffold.dart';
import 'package:history_hub/src/features/register/presentation/controllers/select_address_controller.dart';
import 'package:history_hub/src/features/register/presentation/widgets/select_kabupaten.dart';
import 'package:history_hub/src/features/register/presentation/widgets/select_kecamatan.dart';
import 'package:history_hub/src/features/register/presentation/widgets/select_kelurahan.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SelectAddressScreen extends HookConsumerWidget {
  const SelectAddressScreen({super.key});
  static const routeName = 'select-address-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(selectAddressControllerProvider);

    return AppScaffold(
      title: 'Pilih alamat',
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const SelectKabupaten(),
                Gap(CommonSizes.formGap),
                const SelectKecamatan(),
                Gap(CommonSizes.formGap),
                const SelectKelurahan(),
              ],
            ),
          ),
          Gap(16.h),
          PrimaryButton(
            onPressed: () => context.maybePop(state),
            name: 'Konfirmasi',
          ),
        ],
      ),
    );
  }
}
