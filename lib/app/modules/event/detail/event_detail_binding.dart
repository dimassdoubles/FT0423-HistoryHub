import 'package:get/get.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/modules/event/detail/event_detail_controller.dart';

class EventDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<EventDetailController>(EventDetailController(
      Get.find<AppDatasource>(),
    ));
  }
}
