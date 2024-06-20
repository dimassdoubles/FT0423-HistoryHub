import 'package:get/get.dart';
import 'package:history_hub_v2/app/modules/transaction/detail/detail_transaction_controller.dart';

class DetailTransactionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DetailTransactionController(Get.find()));
  }
}
