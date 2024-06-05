import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/data/models/auth/kelurahan_model.dart';
import 'package:history_hub_v2/app/data/models/result_model.dart';
import 'package:history_hub_v2/app/presentation/widgets/app_dropdown.dart';
import 'package:history_hub_v2/app/presentation/widgets/input/input_text.dart';

import '../select_address_controller.dart';
import 'loading_dropdown.dart';

class SelectKelurahan extends GetView<SelectAddressController> {
  const SelectKelurahan({super.key});

  static const name = 'Kelurahan';
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.listKelurahan.status == ResultStatus.success) {
          return AppDropdown<KelurahanModel?>(
            items: [
              ...controller.listKelurahan.data!.map(
                (item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.nama,
                    style: const TextStyle(color: AppColors.black),
                  ),
                ),
              ),
            ],
            onChanged: (value) => controller.selectedKelurahan = value,
            value: controller.selectedKelurahan,
            name: name,
          );
        } else if (controller.listKelurahan.status == ResultStatus.loading) {
          return const LoadingDropdown(name);
        }
        return const InputText(
          name: name,
          readOnly: true,
        );
      },
    );
  }
}
