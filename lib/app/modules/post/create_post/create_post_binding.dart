import 'package:get/get.dart';
import 'package:history_hub_v2/app/modules/post/create_post/create_post_controller.dart';

class CreatePostBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CreatePostController>(CreatePostController(Get.find()));
  }
}
