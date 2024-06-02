import 'package:get/get.dart';
import 'package:history_hub_v2/app/modules/auth/register/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
