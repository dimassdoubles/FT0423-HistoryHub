import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/core/constants/styles/text_weights.dart';
import 'package:history_hub_v2/app/core/extensions/date_time_extension.dart';
import 'package:history_hub_v2/app/core/extensions/int_extension.dart';
import 'package:history_hub_v2/app/data/models/event/event_model.dart';
import 'package:history_hub_v2/app/modules/event/event_controller.dart';

class EventListItem extends GetView<EventController> {
  final EventModel data;
  const EventListItem(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.goingToDetail(data),
      child: Container(
        margin: EdgeInsets.only(top: 16.w, right: 16.w, left: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(
                  0.2), // You can adjust the shadow color and opacity here
              blurRadius: 20, // Increase the blur radius for a smoother shadow
              spreadRadius:
                  1, // Optional, adjust the spread radius to control the size of the shadow
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.w)),
              child: Container(
                width: 1.sw,
                height: 161.w,
                decoration: BoxDecoration(
                  color: AppColors.neutral200,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15.w),
                  ),
                ),
                child: Image.network(
                  data.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(
                      Icons.image_not_supported_rounded,
                      size: 56,
                      color: AppColors.neutral300,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.nama,
                    style: AppTexts.primary.copyWith(
                      fontSize: 16,
                      fontWeight: TextWeights.medium,
                      color: const Color(0xff545454),
                    ),
                  ),
                  Gap(4.w),
                  Text(
                    '${data.tanggalMulai.display()}${data.tanggalAkhir != null ? ' s/d ${data.tanggalAkhir.display()}' : ''}',
                    style: AppTexts.primary.copyWith(
                      fontSize: 12,
                      color: AppColors.neutral300,
                    ),
                  ),
                  Gap(8.w),
                  Text(
                    data.hargaTiket > 0 ? data.hargaTiket.toIDR() : 'GRATIS',
                    style: AppTexts.primary.copyWith(
                      fontSize: 14,
                      fontWeight: TextWeights.bold,
                      color: AppColors.neutral400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
