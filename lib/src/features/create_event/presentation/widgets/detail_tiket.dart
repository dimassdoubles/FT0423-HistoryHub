import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:history_hub/src/core/formatters/price_formatter.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputText(
          controller: jumlahTiketController,
          name: 'Jumlah Tiket',
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          textInputAction: TextInputAction.next,
        ),
        Gap(8.w),
        InputText(
          controller: hargaTiketController,
          name: 'Harga Tiket',
          keyboardType: TextInputType.number,
          inputFormatters: [PriceInputFormatter()],
          textInputAction: TextInputAction.next,
        ),
        Gap(8.w),
        InputText(
          controller: tanggalJualController,
          onTap: onTap,
          name: 'Tanggal Penjualan Tiket',
          readOnly: true,
          textInputAction: TextInputAction.next,
        ),
      ],
    );
  }
}
