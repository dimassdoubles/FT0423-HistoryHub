import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/helpers/dialog_helper.dart';
import 'package:history_hub_v2/app/modules/photo_editor/presentation/photo_editor_controller.dart';
import 'package:history_hub_v2/app/modules/photo_editor/presentation/widgets/action_button.dart';
import 'package:history_hub_v2/app/modules/post/create_post/create_post_page.dart';
import 'package:image_sketcher/image_sketcher.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

import 'widgets/color_slider.dart';
import 'widgets/line_weight_selector.dart';

class PhotoEditorPage extends GetView<PhotoEditorController> {
  const PhotoEditorPage({
    super.key,
  });

  static const routeName = "/photo-editor";

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Material(
        key: controller.key,
        color: AppColors.black,
        child: SafeArea(
          child: Stack(
            children: [
              Screenshot(
                controller: controller.screenshotController,
                child: ImageSketcher.file(
                  controller.rawImage,
                  key: controller.imageKey,
                  enableToolbar: false,
                  initialPaintMode: controller.paintMode,
                  initialColor: controller.drawColor,
                ),
              ),

              // default bottom bar
              if (controller.paintMode != PaintMode.freeStyle &&
                  !controller.isEditText)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ActionButton(
                      onTap: () {
                        saveImage(
                          context,
                          controller.screenshotController,
                        );
                      },
                      icon: Icons.done_rounded,
                      backgroundColor: AppColors.primary500,
                    ),
                  ),
                ),

              // text bottom bar
              if (controller.isEditText)
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text("Hello World"),
                ),

              // draw bottom bar
              if (controller.paintMode == PaintMode.freeStyle)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: LineWeightSelector(
                    onBrushWeightChanged: (weight) {
                      controller.imageKey.currentState
                          ?.changeBrushWidth(weight);
                    },
                  ),
                ),

              // default top bar
              if (!controller.isEditText &&
                  controller.paintMode != PaintMode.freeStyle)
                _DefaultTopBar(
                  onCancelTap: Get.back,
                  onEnterDrawMode: () {
                    controller.imageKey.currentState
                        ?.changePaintMode(PaintMode.freeStyle);
                    controller.paintMode = PaintMode.freeStyle;
                  },
                  onEnterTextMode: () {
                    controller.imageKey.currentState
                        ?.changePaintMode(PaintMode.text);
                    controller.paintMode = PaintMode.text;
                    controller.isEditText = true;
                  },
                  onUndoTap: () {
                    controller.imageKey.currentState?.undo();
                  },
                ),

              // text top bar
              if (controller.isEditText)
                _TextTopBar(
                  initialColor: controller.drawColor,
                  onDone: (text) {
                    controller.imageKey.currentState?.addText(text);
                    controller.isEditText = false;
                  },
                  onColorChanged: (newColor) {
                    controller.drawColor = newColor;
                    controller.imageKey.currentState?.updateColor(newColor);
                  },
                ),

              // draw top bar
              if (controller.paintMode == PaintMode.freeStyle)
                _DrawTopBar(
                  initialColor: controller.drawColor,
                  onColorChanged: (selectedColor) {
                    controller.imageKey.currentState
                        ?.updateColor(selectedColor);
                    controller.drawColor = selectedColor;
                  },
                  onUndo: () {
                    controller.imageKey.currentState?.undo();
                  },
                  onDone: () {
                    controller.imageKey.currentState
                        ?.changePaintMode(PaintMode.none);
                    controller.paintMode = PaintMode.none;
                  },
                ),
            ],
          ),
        ),
      );
    });
  }

  void saveImage(
    BuildContext context,
    ScreenshotController controller,
  ) async {
    DialogHelper.showLoading();
    bool isLoading = true;

    try {
      final tempDir = await getTemporaryDirectory();
      String fileName =
          '${DateTime.now().microsecondsSinceEpoch.toString()}.png';

      final image = await controller.captureAndSave(
        tempDir.path,
        fileName: fileName,
      );

      if (image != null) {
        debugPrint('image tidak null bray');
        Get.find<PhotoEditorController>().onImageSelected?.call(File(image));
        DialogHelper.dismiss();
        isLoading = false;
      }
    } catch (e) {
      if (isLoading) DialogHelper.dismiss();
      debugPrint("saveImage error: $e");
    } finally {
      Get.offNamedUntil(CreatePostPage.routeName, (route) => true);
    }
  }
}

class _TextTopBar extends StatefulWidget {
  final Color _initialColor;
  final void Function(String text)? _onDone;
  final void Function(Color color)? _onColorChanged;
  const _TextTopBar({
    required Color initialColor,
    void Function(String text)? onDone,
    void Function(Color color)? onColorChanged,
  })  : _onDone = onDone,
        _onColorChanged = onColorChanged,
        _initialColor = initialColor;

  @override
  State<_TextTopBar> createState() => _TextTopBarState();
}

class _TextTopBarState extends State<_TextTopBar> {
  final FocusNode _textFocus = FocusNode();
  final TextEditingController _textController = TextEditingController();

  late Color color = widget._initialColor;

  @override
  void initState() {
    _textFocus.requestFocus();
    debugPrint("requestFocus");
    super.initState();
  }

  @override
  void dispose() {
    _textFocus.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.4),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    widget._onDone?.call(_textController.text);
                  },
                  child: const Text(
                    "Done",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: ColorSlider(
                    onColorChanged: (selectedColor) {
                      setState(() {
                        color = selectedColor;
                      });
                      widget._onColorChanged?.call(selectedColor);
                    },
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: TextField(
                focusNode: _textFocus,
                controller: _textController,
                onSubmitted: (value) => widget._onDone?.call(value),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Add text",
                  hintStyle: TextStyle(
                    fontSize: 24,
                    color: color.withOpacity(0.5),
                  ),
                ),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawTopBar extends StatefulWidget {
  final Color _initialColor;
  final void Function(Color selectedColor)? _onColorChanged;
  final void Function()? _onDone;
  final void Function()? _onUndo;
  const _DrawTopBar({
    required Color initialColor,
    Function(Color selectedColor)? onColorChanged,
    void Function()? onDone,
    void Function()? onUndo,
  })  : _initialColor = initialColor,
        _onColorChanged = onColorChanged,
        _onDone = onDone,
        _onUndo = onUndo;

  @override
  State<_DrawTopBar> createState() => _DrawTopBarState();
}

class _DrawTopBarState extends State<_DrawTopBar> {
  late Color color = widget._initialColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: widget._onDone,
            child: const Text(
              "Done",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
          const Spacer(),
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ActionButton(
                  onTap: widget._onUndo,
                  icon: Icons.undo,
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  children: [
                    ActionButton(
                      onTap: () {},
                      icon: Icons.edit_outlined,
                      backgroundColor: color,
                      color: color == Colors.white
                          ? AppColors.black
                          : Colors.white,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ColorSlider(
                      onColorChanged: (selectedColor) {
                        setState(() {
                          color = selectedColor;
                        });
                        widget._onColorChanged?.call(selectedColor);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DefaultTopBar extends StatelessWidget {
  final void Function()? _onCancelTap;
  final void Function()? _onUndoTap;
  final void Function()? _onEnterTextMode;
  final void Function()? _onEnterDrawMode;
  const _DefaultTopBar({
    void Function()? onCancelTap,
    void Function()? onUndoTap,
    void Function()? onEnterTextMode,
    void Function()? onEnterDrawMode,
  })  : _onCancelTap = onCancelTap,
        _onUndoTap = onUndoTap,
        _onEnterTextMode = onEnterTextMode,
        _onEnterDrawMode = onEnterDrawMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          ActionButton(
            onTap: _onCancelTap,
            icon: Icons.clear,
          ),
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ActionButton(
                  onTap: _onUndoTap,
                  icon: Icons.undo,
                ),
                const SizedBox(
                  width: 16,
                ),
                ActionButton(
                  onTap: _onEnterTextMode,
                  icon: Icons.text_fields_outlined,
                ),
                const SizedBox(
                  width: 16,
                ),
                ActionButton(
                  onTap: () {
                    debugPrint("Aksi draw di klik");
                    _onEnterDrawMode?.call();
                  },
                  icon: Icons.edit_outlined,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
