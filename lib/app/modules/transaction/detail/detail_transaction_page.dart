import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/data/models/result_model.dart';
import 'package:history_hub_v2/app/modules/event/widgets/event_list_item.dart';
import 'package:history_hub_v2/app/modules/transaction/detail/detail_transaction_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DetailTransactionPage extends GetView<DetailTransactionController> {
  const DetailTransactionPage({super.key});

  static const routeName = "/detail-transaction";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
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
              ],
            ),
          ),
          SingleChildScrollView(
            child: Expanded(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(16.w),
                    padding: EdgeInsets.all(16.w),
                    width: 1.sw,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(
                              0.2), // You can adjust the shadow color and opacity here
                          blurRadius:
                              20, // Increase the blur radius for a smoother shadow
                          spreadRadius:
                              1, // Optional, adjust the spread radius to control the size of the shadow
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 0.7.sw,
                          child: Text(
                            'Perlihatkan Tiket Ke Panitia Saat datang ke Lokasi',
                            textAlign: TextAlign.center,
                            style: AppTexts.primary.copyWith(
                              color: AppColors.neutral400,
                            ),
                          ),
                        ),
                        Gap(16.w),
                        QrImageView(
                          data: controller.orderId,
                          size: 0.5.sw,
                        ),
                        Gap(8.w),
                        SizedBox(
                          width: 0.7.sw,
                          child: Text(
                            controller.orderId,
                            textAlign: TextAlign.center,
                            style: AppTexts.primary.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(() {
                    if (controller.event.status == ResultStatus.success) {
                      return EventListItem(controller.event.data!);
                    }
                    return const SizedBox();
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
