import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/modules/profile/profile_controller.dart';
import 'package:history_hub_v2/app/modules/profile/widgets/button_edit_action.dart';
import 'package:history_hub_v2/app/modules/profile/widgets/button_edit_avatar.dart';
import 'package:history_hub_v2/app/modules/profile/widgets/form_edit_profile.dart';

import '../select_address/select_address_page.dart';

class EditProfilePage extends GetView<ProfileController> {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
        child: Column(
          children: [
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonEditAction(
                    onTap: Get.back,
                    label: 'Batalkan',
                  ),
                  ButtonEditAction(
                    onTap: controller.newNama.isEmpty ||
                            controller.newAlamat.isEmpty ||
                            controller.newTelepon.isEmpty
                        ? null
                        : controller.editUserProfile,
                    label: 'Simpan',
                  ),
                ],
              );
            }),
            Gap(16.w),
            const ButtonEditAvatar(),
            Gap(24.w),
            const Divider(
              color: AppColors.neutral200,
            ),
            FormEditProfile(
              textEditingController: controller.namaController,
              label: 'Nama',
            ),
            FormEditProfile(
              textEditingController: controller.phoneController,
              label: 'Telepon',
            ),
            FormEditProfile(
              textEditingController: controller.alamatController,
              onTap: () => Get.toNamed(SelectAddressPage.routeName),
              label: 'Alamat',
            ),
          ],
        ),
      ),
    );
  }
}
