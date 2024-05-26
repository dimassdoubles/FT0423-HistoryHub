import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:history_hub/src/core/constants/styles/common_sizes.dart';
import 'package:history_hub/src/core/extensions/date_time_extension.dart';
import 'package:history_hub/src/features/create_event/presentation/widgets/create_event_header.dart';
import 'package:history_hub/src/features/create_event/presentation/widgets/detail_event.dart';
import 'package:history_hub/src/features/create_event/presentation/widgets/info_penyelenggara.dart';
import 'package:history_hub/src/features/create_event/presentation/widgets/input_deskripsi.dart';
import 'package:history_hub/src/features/create_event/presentation/widgets/input_nama_event.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
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
    final useTanggalMulaiJualCt = useTextEditingController();
    final useTanggalAkhirJualCt = useTextEditingController();

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
                                  content: Container(
                                    width: double.maxFinite,
                                    height: 400,
                                    child: SfDateRangePicker(
                                      onSelectionChanged:
                                          (DateRangePickerSelectionChangedArgs
                                              args) {
                                        print(args.value);
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
                            onTap: () {},
                          ),
                          DetailEvent(
                            label: 'Pilih lokasi',
                            onTap: () {},
                          ),
                          Gap(16.w),
                          const Divider(color: Color(0xffDDDDDD)),
                          Gap(8.w),
                          const InfoPenyelenggara(),
                          Gap(24.w),
                          InputDeskripsi(useDeskripsiCt),
                          Gap(24.w),
                          // DetailTiket(
                          //   jumlahTiketController: useJumlahTiketCt,
                          //   hargaTiketController: useHargaTiketCt,
                          //   tanggalJualController: useTanggalJualCt,
                          // ),
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
    DateTime? useTanggalMulaiEvent,
    DateTime? useTanggalAkhirEvent,
  ) {
    String result = "";
    if (useTanggalMulaiEvent != null) {
      result += useTanggalMulaiEvent.display();
    }

    if (useTanggalAkhirEvent != null) {
      result += " s/d ${useTanggalAkhirEvent.display()}";
    }

    debugPrint(result);
    return result.isNotEmpty ? result : null;
  }
}
