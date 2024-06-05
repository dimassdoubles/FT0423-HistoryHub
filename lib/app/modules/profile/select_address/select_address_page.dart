import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/common_sizes.dart';
import 'package:history_hub_v2/app/presentation/widgets/button/primary_button.dart';
import 'package:history_hub_v2/app/presentation/widgets/scaffold/app_scaffold.dart';

import 'select_address_controller.dart';
import 'widgets/select_kabupaten.dart';
import 'widgets/select_kecamatan.dart';
import 'widgets/select_kelurahan.dart';

class SelectAddressPage extends GetView<SelectAddressController> {
  static const routeName = "/select-address-edit-profile";

  const SelectAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Pilih alamat',
      body: Form(
        key: controller.formKey,
        child: Column(
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
              onPressed: controller.submit,
              name: 'Konfirmasi',
            ),
          ],
        ),
      ),
    );
  }
}
