import 'package:get/get.dart';
import 'package:history_hub_v2/app/modules/auth/register/select_address/select_address_controller.dart';

class SelectAddressBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SelectAddressController>(
      SelectAddressController(
        Get.find(),
        Get.find(),
      ),
    );
  }
}
