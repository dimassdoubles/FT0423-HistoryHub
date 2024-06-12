import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/modules/member/widgets/admin_actions.dart';
import 'package:history_hub_v2/app/modules/member/widgets/member_list_item.dart';

class MemberListView extends StatelessWidget {
  const MemberListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('10 Orang dipilih'),
              Text(
                'Pilih semua',
                style: AppTexts.primary.copyWith(
                  color: AppColors.primary500,
                ),
              ),
            ],
          ),
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
              onRefresh: () async {},
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: 100,
                itemBuilder: (context, index) => const MemberListItem(),
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
        GestureDetector(
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
        ),
      ],
    );
  }
}
