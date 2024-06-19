import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/data/models/result_model.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';
import 'package:history_hub_v2/app/modules/member/member_controller.dart';
import 'package:history_hub_v2/app/modules/member/widgets/admin_actions.dart';
import 'package:history_hub_v2/app/modules/member/widgets/member_list_item.dart';

class MemberListView extends GetView<MemberController> {
  const MemberListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.listMember.status != ResultStatus.success) {
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.primary500,
          ),
        );
      }

      return Column(
        children: [
          const Gap(16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (controller.selectedMember.isNotEmpty)
                    Text('${controller.selectedMember.length} Orang dipilih'),
                  if (controller.selectedMember.isEmpty)
                    Text('${controller.listMember.data!.length} Orang'),
                  GetBuilder<HomeController>(builder: (homeController) {
                    if (!(homeController.currentUser!.isAdmin ||
                        homeController.currentUser!.isSuperAdmin)) {
                      return const SizedBox();
                    }
                    return GestureDetector(
                      onTap: () {
                        if (controller.selectedMember.isEmpty) {
                          controller.selectedMember.value =
                              controller.listMember.data!;
                        } else {
                          controller.selectedMember.value = [];
                        }
                      },
                      child: Obx(() {
                        return Text(
                          controller.selectedMember.isEmpty
                              ? 'Pilih semua'
                              : 'Batalkan pilihan',
                          style: AppTexts.primary.copyWith(
                            color: AppColors.primary500,
                          ),
                        );
                      }),
                    );
                  }),
                ],
              );
            }),
          ),
          const Gap(8),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: RefreshIndicator(
                color: AppColors.primary500,
                onRefresh: () async => controller.onPageRefresh(),
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: controller.listMember.data!.length,
                  itemBuilder: (context, index) => MemberListItem(
                    controller.listMember.data![index],
                  ),
                  separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(
                      color: AppColors.neutral200,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Gap(16),
          Obx(() {
            if (controller.selectedMember.isEmpty) return const SizedBox();
            return GetBuilder<HomeController>(builder: (homeController) {
              if (!(homeController.currentUser!.isAdmin ||
                  homeController.currentUser!.isSuperAdmin)) {
                return const SizedBox();
              }
              return GestureDetector(
                onTap: () {
                  Get.bottomSheet(const AdminActions());
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.keyboard_arrow_up_rounded,
                    ),
                  ),
                ),
              );
            });
          }),
        ],
      );
    });
  }
}
