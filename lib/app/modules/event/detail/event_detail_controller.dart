import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/helpers/dialog_helper.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/models/event/event_model.dart';
import 'package:history_hub_v2/app/data/models/result_model.dart';
import 'package:history_hub_v2/app/data/params/order/create_new_order_params.dart';
import 'package:history_hub_v2/app/modules/transaction/payment/payment_page.dart';

class EventDetailController extends GetxController {
  final AppDatasource datasource;
  EventDetailController(this.datasource);

  @override
  void onInit() {
    onPageRefresh();
    super.onInit();
  }

  void onPageRefresh() {
    getEvent();
    countEventParticipant();
  }

  final _participantCounter = Rx<int?>(null);
  int? get participantCounter => _participantCounter.value;
  set participantCounter(int? value) => _participantCounter.value = value;

  void countEventParticipant() {
    participantCounter = null;
    datasource.countEventParticipant(eventId).then((value) {
      participantCounter = value;
    });
  }

  final String eventId = Get.arguments;

  final _event = ResultModel<EventModel>.initial().obs;
  ResultModel<EventModel> get event => _event.value;
  set event(ResultModel<EventModel> value) => _event.value = value;

  void getEvent() {
    event = ResultModel.loading();
    datasource.getEvent(eventId).then((value) {
      event = ResultModel.success(value);
    }).catchError((e) {
      event = ResultModel.error(Exception(e.toString()));
    });
  }

  void getTransactionToken() {
    DialogHelper.showLoading();
    datasource
        .creaetNewOrder(
      CreateNewOrderParams(
        eventId: event.data!.id,
      ),
    )
        .then((value) async {
      DialogHelper.dismiss();
      if (event.data!.hargaTiket > 0) {
        await Get.toNamed(PaymentPage.routeName, arguments: value);
      }
      onPageRefresh();
    }).catchError((e) {
      DialogHelper.dismiss();
      DialogHelper.showError(e.toString());
    });
  }
}
