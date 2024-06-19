import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_sketcher/image_sketcher.dart';
import 'package:screenshot/screenshot.dart';

class PhotoEditorController extends GetxController {
  PhotoEditorController();

  late final File rawImage = Get.arguments['rawImage'];
  late final void Function(File image)? onImageSelected = Get.arguments['onImageSelected'];

  final imageKey = GlobalKey<ImageSketcherState>();
  final key = GlobalKey<ScaffoldState>();
  final screenshotController = ScreenshotController();

  final _drawColor = Colors.white.obs;
  Color get drawColor => _drawColor.value;
  set drawColor(Color value) => _drawColor.value = value;

  final _paintMode = PaintMode.none.obs;
  get paintMode => _paintMode.value;
  set paintMode(value) => _paintMode.value = value;

  final _isEditText = false.obs;
  bool get isEditText => _isEditText.value;
  set isEditText(bool value) => _isEditText.value = value;
}
