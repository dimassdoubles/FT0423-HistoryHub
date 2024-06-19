import 'package:get/get.dart';
import 'package:history_hub_v2/app/modules/event/list_participant/list_participant_controller.dart';

class ListParticipantBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ListParticipantController(Get.find()));
  }
}
