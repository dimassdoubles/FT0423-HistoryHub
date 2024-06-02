import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/datasources/local_datasource.dart';

class HomeController extends GetxController {
  final AppDatasource datasource;
  final LocalDatasource localDatasource;
  HomeController(this.datasource, this.localDatasource);

  @override
  void onInit() {
    super.onInit();
  }

  late final currentUser = localDatasource.getCurrentUser()!;

  final GlobalKey<SliderDrawerState> sliderDrawerKey =
      GlobalKey<SliderDrawerState>();

  final _isDrawerOpen = false.obs;
  bool get isDrawerOpen => _isDrawerOpen.value;
  set isDrawerOpen(bool value) => _isDrawerOpen.value = value;

  void toggleDrawer() {
    sliderDrawerKey.currentState!.isDrawerOpen
        ? sliderDrawerKey.currentState!.closeSlider()
        : sliderDrawerKey.currentState!.openSlider();

    isDrawerOpen = sliderDrawerKey.currentState!.isDrawerOpen;
    debugPrint(isDrawerOpen.toString());
  }

  void logout() {}
}
