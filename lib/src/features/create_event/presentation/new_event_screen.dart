import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:history_hub/src/core/constants/styles/common_sizes.dart';
import 'package:history_hub/src/core/extensions/date_time_extension.dart';
import 'package:history_hub/src/core/extensions/time_of_day_extension.dart';
import 'package:history_hub/src/features/create_event/presentation/widgets/create_event_header.dart';
import 'package:history_hub/src/features/create_event/presentation/widgets/detail_event.dart';
import 'package:history_hub/src/features/create_event/presentation/widgets/detail_tiket.dart';
import 'package:history_hub/src/features/create_event/presentation/widgets/info_penyelenggara.dart';
import 'package:history_hub/src/features/create_event/presentation/widgets/input_deskripsi.dart';
import 'package:history_hub/src/features/create_event/presentation/widgets/input_lokasi.dart';
import 'package:history_hub/src/features/create_event/presentation/widgets/input_nama_event.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'widgets/add_image_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class NewEventScreen extends HookConsumerWidget {
  const NewEventScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useNamaCt = useTextEditingController();
    final useDeskripsiCt = useTextEditingController();
    final useJumlahTiketCt = useTextEditingController();
    final useHargaTiketCt = useTextEditingController();
    final useTanggalJualCt = useTextEditingController();
    final useLokasiCt = useTextEditingController();

    final useTanggalMulaiEvent = useState<DateTime?>(null);
    final useTanggalAkhirEvent = useState<DateTime?>(null);
    final useTanggalMulaiJualTiket = useState<DateTime?>(null);
    final useTanggalAkhirJualTiket = useState<DateTime?>(null);

    final useJamMulaiEvent = useState<TimeOfDay?>(null);
    final useJamAkhirEvent = useState<TimeOfDay?>(null);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(CommonSizes.pagePadding),
            const CreateEventHeader(),
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
                          InputNamaEvent(useNamaCt),
                          DetailEvent(
                            label: 'Pilih tanggal',
                            value: getRangeTanggalString(
                              useTanggalMulaiEvent.value,
                              useTanggalAkhirEvent.value,
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
                                          useTanggalMulaiEvent.value,
                                      initialSelectedRange: PickerDateRange(
                                          useTanggalMulaiEvent.value,
                                          useTanggalAkhirEvent.value),
                                      onSelectionChanged:
                                          (DateRangePickerSelectionChangedArgs
                                              args) {
                                        debugPrint(
                                          args.value.toString(),
                                        );
                                      },
                                      selectionMode:
                                          DateRangePickerSelectionMode.range,
                                      onSubmit: (selected) {
                                        debugPrint(
                                            selected.runtimeType.toString());
                                        final dateRange =
                                            selected as PickerDateRange?;

                                        if (dateRange != null) {
                                          useTanggalMulaiEvent.value =
                                              dateRange.startDate;
                                          useTanggalAkhirEvent.value =
                                              dateRange.endDate;
                                        }

                                        context.maybePop();
                                      },
                                      onCancel: () {
                                        context.maybePop();
                                      },
                                      enablePastDates: false,
                                      showActionButtons: true,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          DetailEvent(
                            label: 'Pilih waktu',
                            value: getRangeTimeString(
                              useJamMulaiEvent.value,
                              useJamAkhirEvent.value,
                            ),
                            onTap: () async {
                              TimeRange result = await showTimeRangePicker(
                                start: useJamMulaiEvent.value,
                                end: useJamAkhirEvent.value,
                                context: context,
                              );

                              useJamMulaiEvent.value = result.startTime;
                              useJamAkhirEvent.value = result.endTime;
                            },
                          ),
                          InputLokasi(useLokasiCt),
                          Gap(16.w),
                          const Divider(color: Color(0xffDDDDDD)),
                          Gap(8.w),
                          const InfoPenyelenggara(),
                          Gap(24.w),
                          InputDeskripsi(useDeskripsiCt),
                          const Divider(color: Color(0xffDDDDDD)),
                          Gap(24.w),
                          DetailTiket(
                            jumlahTiketController: useJumlahTiketCt,
                            hargaTiketController: useHargaTiketCt,
                            tanggalJualController: useTanggalJualCt,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: SizedBox(
                                    width: double.maxFinite,
                                    height: 400,
                                    child: SfDateRangePicker(
                                      initialDisplayDate:
                                          useTanggalMulaiJualTiket.value,
                                      initialSelectedRange: PickerDateRange(
                                        useTanggalMulaiJualTiket.value,
                                        useTanggalAkhirJualTiket.value,
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
                                          useTanggalMulaiJualTiket.value =
                                              dateRange.startDate;
                                          useTanggalAkhirJualTiket.value =
                                              dateRange.endDate;
                                          useTanggalJualCt.text =
                                              getRangeTanggalString(
                                                    useTanggalMulaiJualTiket
                                                        .value,
                                                    useTanggalAkhirJualTiket
                                                        .value,
                                                  ) ??
                                                  '';
                                        }

                                        context.maybePop();
                                      },
                                      onCancel: () {
                                        context.maybePop();
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
      ),
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
