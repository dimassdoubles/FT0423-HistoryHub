import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/data/models/auth/user_model.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';
import 'package:history_hub_v2/app/modules/member/member_controller.dart';
import 'package:history_hub_v2/app/modules/profile/profile_page.dart';
import 'package:history_hub_v2/app/presentation/widgets/user_avatar.dart';

class MemberListItem extends StatelessWidget {
  final UserModel data;
  const MemberListItem(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          Get.toNamed(
            ProfilePage.routeName,
            arguments: data.id,
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              GetBuilder<HomeController>(builder: (controller) {
                if (controller.currentUser!.isAdmin ||
                    controller.currentUser!.isAdmin) {
                  return GetBuilder<MemberController>(
                    builder: (controller) => Obx(() {
                      return Checkbox(
                        value: controller.selectedMember
                            .map((element) => element.id)
                            .contains(data.id),
                        onChanged: (value) {
                          if (controller.selectedMember
                              .map((element) => element.id)
                              .contains(data.id)) {
                            controller.selectedMember.removeWhere(
                                (element) => element.id == data.id);
                          } else {
                            controller.selectedMember.add(data);
                          }
                        },
                      );
                    }),
                  );
                }
                return const SizedBox();
              }),
              const UserAvatar('', size: 36),
              const Gap(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.fullName),
                  Text(
                    data.email,
                    style:
                        AppTexts.primary.copyWith(color: AppColors.neutral300),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
