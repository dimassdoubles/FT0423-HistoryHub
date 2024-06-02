import 'package:get/get.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/datasources/local_datasource.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';
import 'package:history_hub_v2/app/modules/post/comment/comment_controller.dart';
import 'package:history_hub_v2/app/modules/post/post_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CommentController>(CommentController(Get.find<AppDatasource>()));

    Get.put<PostController>(PostController(
      Get.find<AppDatasource>(),
      Get.find<CommentController>(),
    ));

    Get.put<HomeController>(HomeController(
      Get.find<AppDatasource>(),
      Get.find<LocalDatasource>(),
    ));
  }
}
