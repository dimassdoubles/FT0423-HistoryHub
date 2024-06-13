import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';
import 'package:history_hub_v2/app/modules/member/widgets/member_list_view.dart';

class HomeMemberView extends GetView<HomeController> {
  const HomeMemberView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: MemberListView(),
        )
      ],
    );
  }
}
