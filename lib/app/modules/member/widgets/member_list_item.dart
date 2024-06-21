import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/data/models/auth/user_model.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';
import 'package:history_hub_v2/app/modules/member/member_controller.dart';
import 'package:history_hub_v2/app/modules/post/post_controller.dart';
import 'package:history_hub_v2/app/modules/profile/profile_page.dart';
import 'package:history_hub_v2/app/presentation/widgets/user_avatar.dart';

class MemberListItem extends StatelessWidget {
  final UserModel data;
  const MemberListItem(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Get.toNamed(
          ProfilePage.routeName,
          arguments: data.id,
        );

        Get.find<PostController>().onPageRefresh();
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
                          controller.selectedMember
                              .removeWhere((element) => element.id == data.id);
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
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: UserAvatar(data.avatarUrl, size: 36),
            ),
            const Gap(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(data.fullName),
                      const Gap(4),
                      if (data.isAdmin || data.isSuperAdmin)
                        SvgPicture.asset(
                          'assets/icons/admin.svg',
                          width: 16,
                          colorFilter: const ColorFilter.mode(
                              Color.fromARGB(255, 84, 199, 71),
                              BlendMode.srcIn),
                        ),
                    ],
                  ),
                  Text(
                    data.email,
                    style:
                        AppTexts.primary.copyWith(color: AppColors.neutral300),
                  ),
                ],
              ),
            ),
            if (!data.isCanPost)
              SvgPicture.asset(
                'assets/icons/no_post.svg',
                colorFilter: const ColorFilter.mode(
                    Color.fromARGB(255, 199, 79, 71), BlendMode.srcIn),
              ),
            const Gap(16),
          ],
        ),
      ),
    );
  }
}
