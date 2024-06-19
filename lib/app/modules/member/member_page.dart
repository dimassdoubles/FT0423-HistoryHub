import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/modules/member/member_controller.dart';
import 'package:history_hub_v2/app/modules/member/widgets/member_list_view.dart';
import 'package:history_hub_v2/app/modules/member/widgets/member_search_bar.dart';

class MemberPage extends GetView<MemberController> {
  const MemberPage({super.key});

  static const routeName = '/member';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Row(
              children: [
                IconButton(
                  onPressed: Get.back,
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                ),
                const Gap(8),
                Text(
                  '80 Anggota Komunitas',
                  style: AppTexts.primary.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Gap(10),
          const MemberSearchBar(),
          const Expanded(child: MemberListView()),
        ],
      ),
    );
  }
}
