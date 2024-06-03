import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/modules/event/detail/event_detail_controller.dart';
import 'package:history_hub_v2/app/presentation/widgets/button/primary_button.dart';

class BeliTiketButton extends GetView<EventDetailController> {
  const BeliTiketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onPressed: controller.getTransactionToken,
      name: 'Beli Tiket',
    );
  }
}
