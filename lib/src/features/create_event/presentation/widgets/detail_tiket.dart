import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:history_hub/src/core/constants/styles/app_texts.dart';
import 'package:history_hub/src/core/presentation/widgets/input/input_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailTiket extends HookConsumerWidget {
  final TextEditingController jumlahTiketController;
  final TextEditingController hargaTiketController;
  final TextEditingController tanggalJualController;
  final void Function()? onTap;

  const DetailTiket({
    super.key,
    required this.jumlahTiketController,
    required this.hargaTiketController,
    required this.tanggalJualController,
    this.onTap,
  });

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
          InputText(
            onTap: onTap,
            name: 'Tanggal Mulai',
            readOnly: true,
          ),
        ],
      ),
    );
  }
}
