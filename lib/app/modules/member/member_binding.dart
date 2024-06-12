import 'package:get/get.dart';
import 'package:history_hub_v2/app/modules/member/member_controller.dart';

class MemberBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MemberController>(MemberController(
      Get.find(),
    ));
  }
}
