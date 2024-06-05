import 'package:get/get.dart';

import 'select_address_controller.dart';

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
