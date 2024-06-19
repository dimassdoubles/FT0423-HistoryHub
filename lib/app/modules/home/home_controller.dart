import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/transaction_statuses.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/datasources/local_datasource.dart';
import 'package:history_hub_v2/app/data/models/auth/user_model.dart';
import 'package:history_hub_v2/app/modules/auth/login/login_page.dart';
import 'package:history_hub_v2/app/modules/event/create_event/create_event_page.dart';
import 'package:history_hub_v2/app/modules/event/event_controller.dart';
import 'package:history_hub_v2/app/modules/member/member_controller.dart';
import 'package:history_hub_v2/app/modules/post/create_post/create_post_page.dart';
import 'package:history_hub_v2/app/modules/post/post_controller.dart';
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
      } else if (navBarIndex == 2) {
        Get.find<MemberController>().onPageRefresh();
      }
    });

    queryController.addListener(() {
      final text = queryController.text;
      if (navBarIndex == 0) {
        if (postTabIndex == 0) {
          postinganQuery = text;
        } else if (postTabIndex == 1) {
          acaraQuery = text;
        }
      } else if (navBarIndex == 1) {
        orderQuery = text;
      } else if (navBarIndex == 2) {
        memberQuery = text;
      }
    });

    ever(_navBarIndex, (callback) {
      if (navBarIndex == 0) {
        if (postTabIndex == 0) {
          queryController.text = postinganQuery;
        } else if (postTabIndex == 1) {
          queryController.text = acaraQuery;
        }
      } else if (navBarIndex == 1) {
        queryController.text = orderQuery;
      } else if (navBarIndex == 2) {
        queryController.text = memberQuery;
      }
    });

    ever(_postTabIndex, (callback) {
      if (postTabIndex == 0) {
        queryController.text = postinganQuery;
      } else if (postTabIndex == 1) {
        queryController.text = acaraQuery;
      }
    });

    debounce(_postinganQuery, (callback) {
      try {
        Get.find<PostController>().onPageRefresh();
      } catch (_) {}
    }, time: const Duration(seconds: 1));

    debounce(_acaraQuery, (callback) {
      try {
        Get.find<EventController>().onPageRefresh();
      } catch (_) {}
    }, time: const Duration(seconds: 1));

    debounce(_orderQuery, (callback) {
      try {
        Get.find<TransactionController>().onPageRefresh();
      } catch (_) {}
    }, time: const Duration(seconds: 1));

    debounce(_memberQuery, (callback) {
      try {
        Get.find<MemberController>().onPageRefresh();
      } catch (_) {}
    }, time: const Duration(seconds: 1));

    super.onInit();
  }

  final queryController = TextEditingController();

  final _postinganQuery = ''.obs;
  get postinganQuery => _postinganQuery.value;
  set postinganQuery(value) => _postinganQuery.value = value;

  final _acaraQuery = ''.obs;
  get acaraQuery => _acaraQuery.value;
  set acaraQuery(value) => _acaraQuery.value = value;

  final _orderQuery = ''.obs;
  get orderQuery => _orderQuery.value;
  set orderQuery(value) => _orderQuery.value = value;

  final _memberQuery = ''.obs;
  get memberQuery => _memberQuery.value;
  set memberQuery(value) => _memberQuery.value = value;

  final _postTabIndex = 0.obs;
  int get postTabIndex => _postTabIndex.value;
  set postTabIndex(int value) => _postTabIndex.value = value;

  late TabController postTabController;

  final _transactionTabIndex = 0.obs;
  int get transactionTabIndex => _transactionTabIndex.value;
  set transactionTabIndex(int value) => _transactionTabIndex.value = value;

  late TabController transactionTabController;

  void createPost() async {
    await Get.toNamed(CreatePostPage.routeName);
    Get.find<PostController>().onPageRefresh();
  }

  void createEvent() async {
    await Get.toNamed(CreateEventPage.routeName);
    Get.find<EventController>().onPageRefresh();
  }

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
    datasource.logout();
    Get.offAllNamed(LoginPage.routeName);
  }
}
