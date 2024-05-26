import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:history_hub/src/core/helper/dialog_helper.dart';
import 'package:history_hub/src/core/constants/styles/app_colors.dart';
import 'package:history_hub/src/core/constants/styles/app_texts.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  ImageHelper._();

  /// default compress sampai 1 MB
  /// 1 MB = 1 000 000 Bytes
  static Future<XFile> compressImage(XFile file, {int toBytes = 300000}) async {
    debugPrint('file Size: ${await file.length()}');
    try {
      if (await file.length() <= toBytes) {
        debugPrint('file result size: ${await file.length()}');
        return file;
      }

      final filePath = File(file.path).absolute.path;
      final outPath =
          '${path.dirname(filePath)}/${path.basenameWithoutExtension(filePath)}_out${path.extension(filePath)}';

      late CompressFormat format;

      switch (path.extension(filePath)) {
        case '.heic':
          debugPrint('compress heic');
          format = CompressFormat.heic;
          break;
        case '.png':
          debugPrint('compress png');
          format = CompressFormat.png;
          break;
        case '.jpg':
          debugPrint('compress jpg');
          format = CompressFormat.jpeg;
          break;
        default:
          format = CompressFormat.jpeg;
      }

      final result = await FlutterImageCompress.compressAndGetFile(
        filePath,
        outPath,
        quality: 50,
        minHeight: 720,
        minWidth: 1280,
        format: format,
      );

      if (result != null) {
        return compressImage(result, toBytes: toBytes);
      }

      debugPrint('file result size: ${await file.length()}');
      return file;
    } catch (e) {
      debugPrint('file result size: ${await file.length()}');
      return file;
    }
  }

  static void pickImage({
    required BuildContext context,
    void Function(XFile imagePicked)? onImagePicked,
  }) async {
    String? error;

    try {
      XFile? result;
      bool fromCamera = true;
      bool isCancel = true;

      await showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.w),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () {
                  isCancel = false;
                  context.maybePop();
                },
                leading: const Icon(Icons.camera_alt_rounded),
                title: Text('Kamera', style: AppTexts.primary),
              ),
              ListTile(
                onTap: () {
                  isCancel = false;
                  fromCamera = false;
                  context.maybePop();
                },
                leading: const Icon(Icons.photo_rounded),
                title: Text('Galeri', style: AppTexts.primary),
              ),
            ],
          ),
        ),
      );

      debugPrint('isCancel: $isCancel');
      if (isCancel) {
        return;
      }

      DialogHelper.showLoading();

      final ImagePicker picker = ImagePicker();
      result = await picker.pickImage(
        // ignore: dead_code
        source: fromCamera ? ImageSource.camera : ImageSource.gallery,
      );

      if (result != null) {
        // TODO compress
        result = await compressImage(result);

        onImagePicked?.call(result);
      }
    } catch (e) {
      error = e.toString();
    } finally {
      DialogHelper.dismiss();
      if (error != null) {
        DialogHelper.showError(error);
      }
    }
  }
}
