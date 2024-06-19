import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/modules/event/detail/event_detail_controller.dart';
import 'package:history_hub_v2/app/presentation/widgets/button/primary_button.dart';

class BeliTiketButton extends GetView<EventDetailController> {
  const BeliTiketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool canBuyTicket = false;

      if (controller.participantCounter != null) {
        bool isNotFull =
            controller.participantCounter! < controller.event.data!.jumlahTiket;
        canBuyTicket = isNotFull &&
            DateTime.now().isAfter(controller.event.data!.tanggalMulaiJual
                .subtract(const Duration(days: 1))) &&
            DateTime.now().isBefore(controller.event.data!.tanggalAkhirJual
                .add(const Duration(days: 1)));
      }

      return SizedBox(
        height: 40.w,
        child: PrimaryButton(
          onPressed: canBuyTicket ? controller.getTransactionToken : null,
          name: 'Beli Tiket',
        ),
      );
    });
  }
}
