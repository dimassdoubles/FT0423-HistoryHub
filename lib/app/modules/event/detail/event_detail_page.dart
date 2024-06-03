import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/core/constants/styles/text_weights.dart';
import 'package:history_hub_v2/app/core/extensions/date_time_extension.dart';
import 'package:history_hub_v2/app/core/extensions/int_extension.dart';
import 'package:history_hub_v2/app/core/extensions/time_of_day_extension.dart';
import 'package:history_hub_v2/app/modules/event/detail/event_detail_controller.dart';
import 'package:history_hub_v2/app/modules/event/detail/widgets/beli_tiket_button.dart';
import 'package:photo_view/photo_view.dart';

class EventDetailPage extends GetView<EventDetailController> {
  static const routeName = '/event-detail';

  const EventDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => Stack(
                  children: [
                    PhotoView(
                      imageProvider: NetworkImage(
                        controller.event.image,
                      ),
                    ),
                    IconButton(
                      onPressed: Get.back,
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.black.withOpacity(0.1),
                      ),
                      icon: const Icon(
                        Icons.clear_rounded,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
            child: SizedBox(
              width: 1.sw,
              height: 201.h,
              child: Image.network(
                controller.event.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Gap(16.w),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.event.nama,
                      style: AppTexts.primary.copyWith(
                        fontSize: 16.sp,
                        fontWeight: TextWeights.medium,
                        color: const Color.fromARGB(255, 78, 78, 78),
                      ),
                    ),
                    Gap(16.w),
                    Text(
                      '${controller.event.tanggalMulai.display()}${controller.event.tanggalAkhir != null ? ' s/d ${controller.event.tanggalAkhir.display()}' : ''}',
                      style: AppTexts.primary.copyWith(
                        fontSize: 14.sp,
                        fontWeight: TextWeights.medium,
                        color: AppColors.neutral300,
                      ),
                    ),
                    Gap(4.w),
                    Text(
                      '${controller.event.jamMulai.display()} - ${controller.event.jamAkhir.display()}',
                      style: AppTexts.primary.copyWith(
                        fontSize: 14.sp,
                        fontWeight: TextWeights.medium,
                        color: AppColors.neutral300,
                      ),
                    ),
                    Gap(8.w),
                    Text(
                      controller.event.lokasi,
                      style: AppTexts.primary.copyWith(
                        fontSize: 14.sp,
                        fontWeight: TextWeights.semiBold,
                        color: AppColors.neutral300,
                      ),
                    ),
                    Gap(16.w),
                    const Divider(color: AppColors.neutral200),
                    Gap(16.w),
                    Text(
                      'Deskripsi',
                      style: AppTexts.primary.copyWith(
                        fontWeight: TextWeights.semiBold,
                        color: const Color.fromARGB(255, 71, 71, 71),
                      ),
                    ),
                    Gap(4.w),
                    Text(
                      controller.event.deskripsi,
                      style: AppTexts.primary.copyWith(
                        fontSize: 12,
                        fontWeight: TextWeights.medium,
                        color: AppColors.neutral400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: AppColors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Harga',
                        style: AppTexts.primary.copyWith(
                          fontWeight: TextWeights.medium,
                          color: AppColors.neutral300,
                        ),
                      ),
                      Text(
                        controller.event.hargaTiket.toIDR(),
                        style: AppTexts.primary.copyWith(
                          fontSize: 16.sp,
                          fontWeight: TextWeights.semiBold,
                          color: const Color.fromARGB(255, 40, 40, 40),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 157.w,
                  child: const BeliTiketButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
