import 'package:get/get.dart';
import 'package:history_hub_v2/app/modules/event/create_event/create_event_controller.dart';

class CreateEventBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CreateEventController(Get.find()));
  }
}
