import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:history_hub/src/core/styles/app_colors.dart';
import 'package:history_hub/src/core/styles/common_sizes.dart';
import 'package:history_hub/src/core/widgets/app_dropdown.dart';
import 'package:history_hub/src/core/widgets/button/primary_button.dart';
import 'package:history_hub/src/core/widgets/scaffold/app_scaffold.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectAddressScreen extends HookConsumerWidget {
  const SelectAddressScreen({super.key});
  static const routeName = 'select-address-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      title: 'Pilih alamat',
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                AppDropdown<String>(
                  name: 'Kota / kabupaten',
                  value: null,
                  items: const [
                    DropdownMenuItem(
                      value: 'A',
                      child: Text(
                        'Kabupaten A',
                        style: TextStyle(color: AppColors.black),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'B',
                      child: Text(
                        'Kabupaten B',
                        style: TextStyle(color: AppColors.black),
                      ),
                    ),
                  ],
                  onChanged: (_) {
                    //
                  },
                ),
                Gap(CommonSizes.formGap),
                AppDropdown<String>(
                  name: 'Kecamatan',
                  value: null,
                  items: const [
                    DropdownMenuItem(
                      value: 'A',
                      child: Text(
                        'Kecamatan A',
                        style: TextStyle(color: AppColors.black),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'B',
                      child: Text(
                        'Kecamatan B',
                        style: TextStyle(color: AppColors.black),
                      ),
                    ),
                  ],
                  onChanged: (_) {
                    //
                  },
                ),
                Gap(CommonSizes.formGap),
                AppDropdown<String>(
                  name: 'Kelurahan',
                  value: null,
                  items: const [
                    DropdownMenuItem(
                      value: 'A',
                      child: Text(
                        'Kelurahan A',
                        style: TextStyle(color: AppColors.black),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'B',
                      child: Text(
                        'Kelurahan B',
                        style: TextStyle(color: AppColors.black),
                      ),
                    ),
                  ],
                  onChanged: (_) {
                    //
                  },
                ),
              ],
            ),
          ),
          Gap(16.h),
          PrimaryButton(
            onPressed: () => context.pop(),
            name: 'Konfirmasi',
          ),
        ],
      ),
    );
  }
}
