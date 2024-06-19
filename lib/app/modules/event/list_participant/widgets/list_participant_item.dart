import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:history_hub_v2/app/core/constants/order_statuses.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/data/models/event/event_participant_model.dart';
import 'package:history_hub_v2/app/presentation/widgets/user_avatar.dart';

class ListParticipantItem extends StatelessWidget {
  final EventParticipantModel data;
  const ListParticipantItem(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.toNamed(
        //   ProfilePage.routeName,
        //   arguments: data.id,
        // );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: UserAvatar(data.imageUrl, size: 36),
            ),
            const Gap(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.name),
                  Text(
                    data.orderId,
                    maxLines: 1,
                    softWrap: false,
                    style: AppTexts.primary.copyWith(
                      fontSize: 12,
                      color: AppColors.neutral300,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(24),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: data.statusId == OrderStatuses.aktif.code
                    ? Colors.blue[100]
                    : Colors.green[100],
                border: Border.all(
                  color: data.statusId == OrderStatuses.aktif.code
                      ? Colors.blue[300]!
                      : Colors.green[300]!,
                ),
              ),
              child: Center(
                  child: Text(
                      data.statusId == OrderStatuses.aktif.code ? 'A' : 'S')),
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }
}
