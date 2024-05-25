import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:history_hub/src/core/data/models/kecamatan.dart';
import 'package:history_hub/src/core/styles/app_colors.dart';
import 'package:history_hub/src/core/widgets/app_dropdown.dart';
import 'package:history_hub/src/core/widgets/input/input_text.dart';
import 'package:history_hub/src/features/register/presentation/providers/list_kecamatan_provider.dart';
import 'package:history_hub/src/features/register/presentation/controllers/select_address_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectKecamatan extends HookConsumerWidget {
  const SelectKecamatan({super.key});

  static const name = 'Kecamatan';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(selectAddressControllerProvider);
    final listKecamatan = ref.watch(listKecamatanProvider);

    return listKecamatan.when(
      data: (data) => AppDropdown<Kecamatan?>(
        name: name,
        value: state.kecamatan,
        items: [
          ...data.map(
            (item) => DropdownMenuItem(
              value: item,
              child: Text(
                item.nama,
                style: const TextStyle(color: AppColors.black),
              ),
            ),
          ),
        ],
        onChanged: (value) {
          ref
              .read(selectAddressControllerProvider.notifier)
              .selectKecamatan(value!);
        },
      ),
      loading: () => InputText(
        name: name,
        readOnly: true,
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: Transform.scale(
            scale: 0.5,
            child: CircularProgressIndicator(
              strokeWidth: 6.w,
              color: AppColors.primary500,
            ),
          ),
        ),
      ),
      error: (error, stackTrace) => const InputText(
        name: name,
        readOnly: true,
      ),
    );
  }
}
