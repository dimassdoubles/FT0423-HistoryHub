import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:history_hub/src/core/constants/styles/app_texts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddImageButton extends HookConsumerWidget {
  const AddImageButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 1.sw,
      height: (1 / 2).sw,
      decoration: const BoxDecoration(
        color: Color(0xffF1F7FF),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/add-image.png',
            width: 55.w,
          ),
          Text(
            'Unggah gambar/poster/banner',
            style: AppTexts.primary.copyWith(
              fontSize: 14,
              color: const Color(0xff8C8C8C),
            ),
          ),
        ],
      ),
    );
  }
}
