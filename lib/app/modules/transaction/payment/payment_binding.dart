import 'package:get/get.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/modules/transaction/payment/payment_controller.dart';

class PaymentBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<PaymentController>(PaymentController(
      Get.find<AppDatasource>(),
    ));
  }
}
