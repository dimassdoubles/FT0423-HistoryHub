import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/helpers/dialog_helper.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/models/auth/user_model.dart';
import 'package:history_hub_v2/app/data/models/result_model.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';
import 'package:history_hub_v2/app/modules/home/home_page.dart';

class MemberController extends GetxController {
  final AppDatasource datasource;
  MemberController(this.datasource);

  @override
  void onInit() {
    getListMember();
    super.onInit();
  }

  final selectedMember = <UserModel>[].obs;

  void onPageRefresh() {
    getListMember();
  }

  void addAdmin() {
    Get.back();
    DialogHelper.showLoading();
    datasource
        .addAdmin(selectedMember.map((element) => element.id).toList())
        .then((value) {
      DialogHelper.dismiss();
      DialogHelper.showSuccess('Berhasil menjadikan admin');
      getListMember();
    }).catchError((e) {
      DialogHelper.dismiss();
      DialogHelper.showError('Gagal menjadikan admin: ${e.toString()}');
    });
  }

  void removeAdmin() {
    Get.back();
    Get.until((route) => Get.currentRoute == HomePage.routeName);
    DialogHelper.showLoading();
    datasource
        .removeAdmin(selectedMember.map((element) => element.id).toList())
        .then((value) {
      DialogHelper.dismiss();
      DialogHelper.showSuccess('Berhasil menghapus admin');
      getListMember();
    }).catchError((e) {
      DialogHelper.dismiss();
      DialogHelper.showError('Gagal menghapus admin: ${e.toString()}');
    });
  }

  final _listMember = ResultModel<List<UserModel>>.initial().obs;
  ResultModel<List<UserModel>> get listMember => _listMember.value;
  set listMember(ResultModel<List<UserModel>> value) =>
      _listMember.value = value;
  void getListMember() {
    String keyword = '';
    String currentUserId = '';

    try {
      keyword = Get.find<HomeController>().memberQuery;
      currentUserId = Get.find<HomeController>().currentUser!.id;
    } catch (_) {}

    selectedMember.value = [];

    debugPrint('getListMember on Controller');
    listMember = ResultModel.loading();

    datasource.getListMember(keyword).then((value) {
      debugPrint('getListMember sukses');
      listMember = ResultModel.success(
        value.where((element) => element.id != currentUserId).toList(),
      );
    }).catchError((e) {
      debugPrint('getListMember error ${e.runtimeType}');
      listMember = ResultModel.error(e);
    });
  }
}
