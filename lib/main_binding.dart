import 'package:get/get.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/datasources/local_datasource.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LocalDatasource>(HiveDatasource());
    Get.put<AppDatasource>(AppDatasourceImpl(Get.find<LocalDatasource>()));
  }
}
