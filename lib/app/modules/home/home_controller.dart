import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/transaction_statuses.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/datasources/local_datasource.dart';
import 'package:history_hub_v2/app/data/models/auth/user_model.dart';
import 'package:history_hub_v2/app/modules/auth/login/login_page.dart';
import 'package:history_hub_v2/app/modules/transaction/transaction_controller.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  final AppDatasource datasource;
  final LocalDatasource localDatasource;
  HomeController(this.datasource, this.localDatasource);

  @override
  void onInit() {
    postTabController = TabController(length: 2, vsync: this);
    postTabController.animation?.addListener(() {
      int indexChange = postTabController.offset.round();
      int index = postTabController.index + indexChange;

      postTabIndex = index;
    });

    transactionTabController = TabController(
      length: TransactionStatuses.values.length,
      vsync: this,
      initialIndex: 1,
    );
    transactionTabController.addListener(() {
      debugPrint('transaction tab listener');
      Get.find<TransactionController>().transactionStatuses =
          TransactionStatuses.values[transactionTabController.index];
    });

    ever(_navBarIndex, (callback) {
      if (navBarIndex == 1) {
        Get.find<TransactionController>().onPageRefresh();
      }
    });

    super.onInit();
  }

  final _postTabIndex = 0.obs;
  int get postTabIndex => _postTabIndex.value;
  set postTabIndex(int value) => _postTabIndex.value = value;

  late TabController postTabController;

  final _transactionTabIndex = 0.obs;
  int get transactionTabIndex => _transactionTabIndex.value;
  set transactionTabIndex(int value) => _transactionTabIndex.value = value;

  late TabController transactionTabController;

  void createPost() {}

  final _navBarIndex = 0.obs;
  int get navBarIndex => _navBarIndex.value;
  set navBarIndex(int value) => _navBarIndex.value = value;

  late final _currentUser = Rx<UserModel?>(localDatasource.getCurrentUser());
  UserModel? get currentUser => _currentUser.value;
  set currentUser(UserModel? value) => _currentUser.value = value;

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

  void logout() {
    // TODO buat logic yang benar
    Get.toNamed(LoginPage.routeName);
  }
}
