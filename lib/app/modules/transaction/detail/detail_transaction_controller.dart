import 'package:get/get.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/models/event/event_model.dart';
import 'package:history_hub_v2/app/data/models/result_model.dart';

class DetailTransactionController extends GetxController {
  final AppDatasource datasource;
  DetailTransactionController(this.datasource);

  @override
  void onInit() {
    getEventByOrderId();

    super.onInit();
  }

  final orderId = Get.arguments;

  final _event = ResultModel<EventModel>.initial().obs;
  ResultModel<EventModel> get event => _event.value;
  set event(ResultModel<EventModel> value) => _event.value = value;

  void getEventByOrderId() {
    event = ResultModel.loading();
    datasource.getEventByOrderId(orderId).then((value) {
      event = ResultModel.success(value);
    }).catchError((e) {
      event = ResultModel.error(Exception(e.toString()));
    });
  }
}
