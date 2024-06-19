// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';
import 'package:history_hub_v2/app/modules/member/member_controller.dart';
import 'package:history_hub_v2/app/modules/member/widgets/admin_action_item.dart';

class AdminActions extends GetView<MemberController> {
  const AdminActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() {
                return Text(
                    '${controller.selectedMember.length} Orang dipilih');
              }),
              IconButton(
                onPressed: Get.back,
                icon: const Icon(
                  Icons.clear_rounded,
                ),
              ),
            ],
          ),
          const Gap(4),
          Container(
            decoration: BoxDecoration(
              color: AdminActionItems.bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(10),
                if (Get.find<HomeController>().currentUser!.isSuperAdmin) ...[
                  AdminActionItems(
                    label: 'Hapus Dari Admin',
                    onTap: controller.removeAdmin,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Divider(color: AppColors.white),
                  ),
                ],
                AdminActionItems(
                  label: 'Jadikan Admin',
                  onTap: controller.addAdmin,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Divider(color: AppColors.white),
                ),
                AdminActionItems(label: 'Keluarkan Dari Komunitas'),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Divider(color: AppColors.white),
                ),
                AdminActionItems(label: 'Larang Posting'),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Divider(color: AppColors.white),
                ),
                AdminActionItems(
                  label: 'Izinkan Posting',
                  onTap: controller.allowToPost,
                ),
                Gap(10),
              ],
            ),
          ),
          const Gap(16),
        ],
      ),
    );
  }
}
