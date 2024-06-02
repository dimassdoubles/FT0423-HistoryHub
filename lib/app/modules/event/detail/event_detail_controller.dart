import 'package:get/get.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/models/event/event_model.dart';

class EventDetailController extends GetxController {
  final AppDatasource datasource;
  EventDetailController(this.datasource);

  final EventModel event = Get.arguments;
}
