import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/data/datasources/local_datasource.dart';
import 'package:history_hub_v2/app/modules/auth/login/login_page.dart';
import 'package:history_hub_v2/app/modules/home/home_page.dart';

class SplashController extends GetxController {
  final LocalDatasource _localDatasource;
  SplashController(this._localDatasource);

  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 3),
      toTheNextPage,
    );
    super.onInit();
  }

  void toTheNextPage() {
    if (_localDatasource.isLoggedIn()) {
      debugPrint('sudah login');
      Navigator.of(Get.context!).pushReplacementNamed(HomePage.routeName);
    } else {
      debugPrint('belum login');
      Navigator.of(Get.context!).pushReplacementNamed(LoginPage.routeName);
    }
  }
}
