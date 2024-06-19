import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/core/helpers/image_helper.dart';
import 'package:history_hub_v2/app/modules/event/create_event/create_event_controller.dart';

class AddImageButton extends GetView<CreateEventController> {
  const AddImageButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        onTap: controller.image == null
            ? () {
                ImageHelper.pickImage(
                  context: context,
                  onImagePicked: (imagePicked) {
                    controller.image = File(imagePicked.path);
                  },
                );
              }
            : null,
        child: Container(
          width: 1.sw,
          height: (1 / 2).sw,
          decoration: const BoxDecoration(
            color: Color(0xffF1F7FF),
          ),
          child: controller.image != null
              ? Stack(
                  children: [
                    Image.file(
                      controller.image!,
                      fit: BoxFit.cover,
                      width: 1.sw,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(4.w),
                        child: IconButton(
                          onPressed: () {
                            controller.image = null;
                          },
                          style: IconButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: AppColors.black.withOpacity(0.3),
                          ),
                          icon: const Icon(
                            Icons.delete_outline_rounded,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/add-image.png',
                      width: 55.w,
                    ),
                    Text(
                      'Unggah gambar/ poster/ banner',
                      style: AppTexts.primary.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 178, 178, 178),
                      ),
                    ),
                  ],
                ),
        ),
      );
    });
  }
}
