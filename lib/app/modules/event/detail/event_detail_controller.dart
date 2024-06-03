import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/helpers/dialog_helper.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/models/event/event_model.dart';
import 'package:history_hub_v2/app/data/params/order/create_new_order_params.dart';
import 'package:history_hub_v2/app/modules/transaction/payment/payment_page.dart';

class EventDetailController extends GetxController {
  final AppDatasource datasource;
  EventDetailController(this.datasource);

  final EventModel event = Get.arguments;

  void getTransactionToken() {
    DialogHelper.showLoading();
    datasource
        .creaetNewOrder(
      CreateNewOrderParams(
        price: event.hargaTiket,
        eventId: event.id,
      ),
    )
        .then((value) {
      DialogHelper.dismiss();
      Get.toNamed(PaymentPage.routeName, arguments: value);
    }).catchError((e) {
      DialogHelper.dismiss();
      DialogHelper.showError(e.toString());
    });
  }
}
