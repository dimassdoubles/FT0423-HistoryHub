import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:history_hub/src/core/constants/styles/app_texts.dart';
import 'package:history_hub/src/core/presentation/widgets/input/input_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailTiket extends HookConsumerWidget {
  const DetailTiket({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const InputText(
            name: 'Jumlah Tiket',
            keyboardType: TextInputType.number,
          ),
          Gap(8.w),
          const InputText(
            name: 'Harga Tiket',
            keyboardType: TextInputType.number,
          ),
          Gap(16.w),
          Text(
            'Tanggal Penjualan',
            style: AppTexts.primary.copyWith(
              fontSize: 12,
              color: const Color(0xff797979),
            ),
          ),
          Gap(8.w),
          const InputText(
            name: 'Tanggal Mulai',
            readOnly: true,
          ),
          Gap(8.w),
          const InputText(
            name: 'Tanggal Berakhir',
            readOnly: true,
          ),
        ],
      ),
    );
  }
}
