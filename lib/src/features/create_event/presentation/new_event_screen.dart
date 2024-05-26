import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:history_hub/src/core/constants/styles/common_sizes.dart';
import 'package:history_hub/src/features/create_event/presentation/widgets/create_event_header.dart';
import 'package:history_hub/src/features/create_event/presentation/widgets/detail_event.dart';
import 'package:history_hub/src/features/create_event/presentation/widgets/info_penyelenggara.dart';
import 'package:history_hub/src/features/create_event/presentation/widgets/input_deskripsi.dart';
import 'package:history_hub/src/features/create_event/presentation/widgets/input_nama_event.dart';
import 'package:history_hub/src/features/create_event/presentation/widgets/detail_tiket.dart';
import 'widgets/add_image_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class NewEventScreen extends HookConsumerWidget {
  const NewEventScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                          const InputNamaEvent(),
                          DetailEvent(
                            label: 'Pilih tanggal',
                            onTap: () {},
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
                          const InputDeskripsi(),
                          Gap(24.w),
                          const DetailTiket(),
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
}
