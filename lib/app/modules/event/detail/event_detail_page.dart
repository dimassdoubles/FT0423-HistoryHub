import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/core/constants/styles/text_weights.dart';
import 'package:history_hub_v2/app/core/extensions/date_time_extension.dart';
import 'package:history_hub_v2/app/core/extensions/int_extension.dart';
import 'package:history_hub_v2/app/core/extensions/time_of_day_extension.dart';
import 'package:history_hub_v2/app/data/models/result_model.dart';
import 'package:history_hub_v2/app/modules/event/detail/event_detail_controller.dart';
import 'package:history_hub_v2/app/modules/event/detail/widgets/beli_tiket_button.dart';
import 'package:history_hub_v2/app/modules/event/list_participant/list_participant_page.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';
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
      body: Obx(() {
        final status = controller.event.status;

        if (status == ResultStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary500,
            ),
          );
        } else if (status == ResultStatus.error) {
          return Center(
            child: Text(
              'Terjadi kesalahan: ${controller.event.error.toString()}',
              style: AppTexts.primary,
            ),
          );
        }

        return Column(
          children: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => Stack(
                    children: [
                      PhotoView(
                        imageProvider: NetworkImage(
                          controller.event.data!.image,
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
              child: Container(
                width: 1.sw,
                height: 201.h,
                color: AppColors.neutral200,
                child: Image.network(
                  controller.event.data!.image,
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
            Gap(16.w),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.event.data!.nama,
                        style: AppTexts.primary.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gap(16.w),
                      Gap(16.w),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/calendar.svg',
                            colorFilter: const ColorFilter.mode(
                              AppColors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                          Gap(8.w),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.w),
                            child: Text(
                              '${controller.event.data!.tanggalMulai.display()}${controller.event.data!.tanggalAkhir != null ? ' s/d ${controller.event.data!.tanggalAkhir.display()}' : ''}',
                              style: AppTexts.primary.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(8.w),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/clock.svg',
                            colorFilter: const ColorFilter.mode(
                              AppColors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                          Gap(8.w),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.w),
                            child: Text(
                              '${controller.event.data!.jamMulai.display()} - ${controller.event.data!.jamAkhir.display()}',
                              style: AppTexts.primary.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(8.w),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/place.svg',
                            colorFilter: const ColorFilter.mode(
                              AppColors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                          Gap(8.w),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.w),
                            child: Text(
                              controller.event.data!.lokasi,
                              style: AppTexts.primary.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(8.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/member.svg',
                                colorFilter: const ColorFilter.mode(
                                  AppColors.black,
                                  BlendMode.srcIn,
                                ),
                              ),
                              Gap(8.w),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.w),
                                child: Text(
                                  '${controller.participantCounter ?? '-'} / ${controller.event.data!.jumlahTiket} Pendaftar',
                                  style: AppTexts.primary.copyWith(
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (Get.find<HomeController>().currentUser!.isAdmin ||
                              Get.find<HomeController>()
                                  .currentUser!
                                  .isSuperAdmin)
                            IconButton(
                              onPressed: () {
                                Get.toNamed(
                                  ListParticipantPage.routeName,
                                  arguments: controller.eventId,
                                );
                              },
                              icon: const Icon(
                                Icons.chevron_right_rounded,
                              ),
                            ),
                        ],
                      ),
                      Gap(24.w),
                      const Divider(color: AppColors.neutral200),
                      Gap(16.w),
                      Text(
                        'Deskripsi',
                        style: AppTexts.primary.copyWith(
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 119, 119, 119),
                        ),
                      ),
                      Gap(4.w),
                      Text(
                        controller.event.data!.deskripsi,
                        style: AppTexts.primary.copyWith(
                          fontWeight: TextWeights.medium,
                          fontSize: 14.sp,
                        ),
                      ),
                      const Gap(64),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              color: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // jika harinya adalah hari penjualan tiket
                  if (!(DateTime.now().isAfter(controller
                          .event.data!.tanggalMulaiJual
                          .subtract(const Duration(days: 1))) &&
                      DateTime.now().isBefore(controller
                          .event.data!.tanggalAkhirJual
                          .add(const Duration(days: 1))))) ...[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.info_outlined,
                          size: 16,
                          color: AppColors.neutral400,
                        ),
                        const Gap(4),
                        Expanded(
                          child: Text(
                            'Pendaftaran dilakukan pada tanggal ${controller.event.data!.tanggalMulai.display()}${controller.event.data!.tanggalAkhir != null ? ' s/d ${controller.event.data!.tanggalAkhir.display()}' : ''}',
                            style: AppTexts.primary.copyWith(
                              fontSize: 12,
                              color: AppColors.neutral400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(8),
                  ],
                  Row(
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
                              controller.event.data!.hargaTiket.toIDR(),
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
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
