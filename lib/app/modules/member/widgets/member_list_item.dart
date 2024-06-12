import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/modules/member/widgets/admin_actions.dart';
import 'package:history_hub_v2/app/presentation/widgets/user_avatar.dart';

class MemberListItem extends StatelessWidget {
  const MemberListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(const AdminActions());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (value) {},
            ),
            const UserAvatar('', size: 36),
            const Gap(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Nama Member'),
                Text(
                  'member@gmail.com',
                  style: AppTexts.primary.copyWith(color: AppColors.neutral300),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
