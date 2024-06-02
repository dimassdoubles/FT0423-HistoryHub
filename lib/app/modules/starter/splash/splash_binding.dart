import 'package:get/get.dart';
import 'package:history_hub_v2/app/data/datasources/local_datasource.dart';
import 'package:history_hub_v2/app/modules/starter/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController(Get.find<LocalDatasource>()));
  }
}
