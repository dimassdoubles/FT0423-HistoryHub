import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/core/formatters/price_formatter.dart';
import 'package:history_hub_v2/app/presentation/widgets/input/input_text.dart';

class DetailTiket extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jumlah Tiket',
          style: AppTexts.primary.copyWith(
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 119, 119, 119),
          ),
        ),
        Gap(8.w),
        InputText(
          controller: jumlahTiketController,
          name: '',
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          textInputAction: TextInputAction.next,
        ),
        Gap(16.w),
        Text(
          'Harga Tiket',
          style: AppTexts.primary.copyWith(
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 119, 119, 119),
          ),
        ),
        Gap(8.w),
        InputText(
          controller: hargaTiketController,
          name: '',
          preffixIcon: Text(
            'Rp ',
            style: AppTexts.primary,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [PriceInputFormatter()],
          textInputAction: TextInputAction.next,
        ),
        Gap(16.w),
        Text(
          'Tanggal Penjualan Tiket',
          style: AppTexts.primary.copyWith(
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 119, 119, 119),
          ),
        ),
        Gap(8.w),
        InputText(
          controller: tanggalJualController,
          onTap: onTap,
          name: '',
          readOnly: true,
          textInputAction: TextInputAction.next,
        ),
      ],
    );
  }
}
