import 'package:get/get.dart';
import 'package:history_hub_v2/app/modules/photo_editor/presentation/photo_editor_controller.dart';

class PhotoEditorBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PhotoEditorController());
  }
}
