import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:history_hub/src/core/data/models/kabupaten.dart';
import 'package:history_hub/src/core/constants/styles/app_colors.dart';
import 'package:history_hub/src/core/presentation/widgets/app_dropdown.dart';
import 'package:history_hub/src/core/presentation/widgets/input/input_text.dart';
import 'package:history_hub/src/features/register/presentation/providers/list_kabupaten_provider.dart';
import 'package:history_hub/src/features/register/presentation/controllers/select_address_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectKabupaten extends HookConsumerWidget {
  const SelectKabupaten({super.key});

  static const name = 'Kota / Kabupaten';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(selectAddressControllerProvider);
    final listKabupaten = ref.watch(listKabupatenProvider);

    return listKabupaten.when(
      data: (data) => AppDropdown<Kabupaten?>(
        name: name,
        value: state.kabupaten,
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
              .selectKabupaten(value!);
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
