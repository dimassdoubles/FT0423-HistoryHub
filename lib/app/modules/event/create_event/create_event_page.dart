import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/common_sizes.dart';
import 'package:history_hub_v2/app/core/extensions/date_time_extension.dart';
import 'package:history_hub_v2/app/core/extensions/time_of_day_extension.dart';
import 'package:history_hub_v2/app/modules/event/create_event/create_event_controller.dart';
import 'package:history_hub_v2/app/modules/event/create_event/widgets/add_image_button.dart';
import 'package:history_hub_v2/app/modules/event/create_event/widgets/create_event_header.dart';
import 'package:history_hub_v2/app/modules/event/create_event/widgets/detail_event.dart';
import 'package:history_hub_v2/app/modules/event/create_event/widgets/detail_tiket.dart';
import 'package:history_hub_v2/app/modules/event/create_event/widgets/input_deskripsi.dart';
import 'package:history_hub_v2/app/modules/event/create_event/widgets/input_lokasi.dart';
import 'package:history_hub_v2/app/modules/event/create_event/widgets/input_nama_event.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:time_range_picker/time_range_picker.dart';

class CreateEventPage extends GetView<CreateEventController> {
  const CreateEventPage({super.key});

  static const routeName = '/create-event';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(CommonSizes.pagePadding),
              CreateEventHeader(controller.createEvent),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(24.h),
                      const AddImageButton(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputNamaEvent(controller.nameCtrl),
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
                                DetailEvent(
                                  label: 'Pilih tanggal',
                                  value: getRangeTanggalString(
                                    controller.tanggalMulaiEvent,
                                    controller.tanggalAkhirEvent,
                                  ),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        content: SizedBox(
                                          width: double.maxFinite,
                                          height: 400,
                                          child: SfDateRangePicker(
                                            initialDisplayDate:
                                                controller.tanggalMulaiEvent,
                                            initialSelectedRange:
                                                PickerDateRange(
                                              controller.tanggalMulaiEvent,
                                              controller.tanggalAkhirEvent,
                                            ),
                                            onSelectionChanged:
                                                (DateRangePickerSelectionChangedArgs
                                                    args) {
                                              debugPrint(
                                                args.value.toString(),
                                              );
                                            },
                                            selectionMode:
                                                DateRangePickerSelectionMode
                                                    .range,
                                            onSubmit: (selected) {
                                              debugPrint(selected.runtimeType
                                                  .toString());
                                              final dateRange =
                                                  selected as PickerDateRange?;

                                              if (dateRange != null) {
                                                controller.tanggalMulaiEvent =
                                                    dateRange.startDate;
                                                controller.tanggalAkhirEvent =
                                                    dateRange.endDate;

                                                controller.tanggalMulaiJual =
                                                    null;
                                                controller.tanggalAkhirJual =
                                                    null;
                                                controller
                                                    .tanggalJualCtrl.text = '';
                                              }

                                              Get.back();
                                            },
                                            onCancel: () {
                                              Get.back();
                                            },
                                            enablePastDates: false,
                                            showActionButtons: true,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
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
                                DetailEvent(
                                  label: 'Pilih waktu',
                                  value: getRangeTimeString(
                                    controller.jamMulaiEvent,
                                    controller.jamAkhirEvent,
                                  ),
                                  onTap: () async {
                                    TimeRange result =
                                        await showTimeRangePicker(
                                      start: controller.jamMulaiEvent,
                                      end: controller.jamAkhirEvent,
                                      context: context,
                                    );

                                    controller.jamMulaiEvent = result.startTime;
                                    controller.jamAkhirEvent = result.endTime;
                                  },
                                ),
                              ],
                            ),
                            Gap(8.w),
                            InputLokasi(controller.lokasiCtrl),
                            // Gap(8.w),
                            // const InfoPenyelenggara(),
                            Gap(24.w),
                            InputDeskripsi(controller.deskripsiCtrl),
                            const Divider(color: Color(0xffDDDDDD)),
                            Gap(24.w),
                            DetailTiket(
                              jumlahTiketController:
                                  controller.jumlahTicketCtrl,
                              hargaTiketController: controller.hargaCtrl,
                              tanggalJualController: controller.tanggalJualCtrl,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: SizedBox(
                                      width: double.maxFinite,
                                      height: 400,
                                      child: SfDateRangePicker(
                                        maxDate: controller.tanggalMulaiEvent
                                            ?.subtract(
                                          const Duration(days: 1),
                                        ),
                                        initialDisplayDate:
                                            controller.tanggalMulaiJual,
                                        initialSelectedRange: PickerDateRange(
                                          controller.tanggalMulaiJual,
                                          controller.tanggalAkhirJual,
                                        ),
                                        onSelectionChanged:
                                            (DateRangePickerSelectionChangedArgs
                                                args) {
                                          debugPrint(args.value.toString());
                                        },
                                        selectionMode:
                                            DateRangePickerSelectionMode.range,
                                        onSubmit: (selected) {
                                          debugPrint(
                                              selected.runtimeType.toString());
                                          final dateRange =
                                              selected as PickerDateRange?;

                                          if (dateRange != null) {
                                            controller.tanggalMulaiJual =
                                                dateRange.startDate;
                                            controller.tanggalAkhirJual =
                                                dateRange.endDate;
                                            controller.tanggalJualCtrl.text =
                                                getRangeTanggalString(
                                                      controller
                                                          .tanggalMulaiJual,
                                                      controller
                                                          .tanggalAkhirJual,
                                                    ) ??
                                                    '';
                                          }

                                          Get.back();
                                        },
                                        onCancel: () {
                                          Get.back();
                                        },
                                        enablePastDates: false,
                                        showActionButtons: true,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            const Gap(64),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  String? getRangeTanggalString(
    DateTime? dateStart,
    DateTime? dateEnd,
  ) {
    String result = "";
    if (dateStart != null) {
      result += dateStart.display();
    }

    if (dateEnd != null) {
      result += " s/d ${dateEnd.display()}";
    }

    debugPrint(result);
    return result.isNotEmpty ? result : null;
  }

  String? getRangeTimeString(
    TimeOfDay? timeStart,
    TimeOfDay? timeEnd,
  ) {
    String result = "";
    if (timeStart != null) {
      result += timeStart.display();
    }

    if (timeEnd != null) {
      result += " s/d ${timeEnd.display()}";
    }

    debugPrint(result);
    return result.isNotEmpty ? result : null;
  }
}
