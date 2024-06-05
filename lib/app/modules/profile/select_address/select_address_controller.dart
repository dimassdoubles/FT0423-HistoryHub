import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/models/auth/kabupaten_model.dart';
import 'package:history_hub_v2/app/data/models/auth/kecamatan_model.dart';
import 'package:history_hub_v2/app/data/models/auth/kelurahan_model.dart';
import 'package:history_hub_v2/app/data/models/result_model.dart';
import 'package:history_hub_v2/app/modules/profile/profile_controller.dart';

class SelectAddressController extends GetxController {
  final AppDatasource datasource;
  final ProfileController profileController;
  SelectAddressController(this.datasource, this.profileController);

  @override
  void onInit() {
    getListKabupaten();
    super.onInit();
  }

  final formKey = GlobalKey<FormState>();

  late final _selectedKabupaten = Rx<KabupatenModel?>(null);
  KabupatenModel? get selectedKabupaten => _selectedKabupaten.value;
  set selectedKabupaten(KabupatenModel? value) {
    _selectedKabupaten.value = value;

    selectedKecamatan = null;
    selectedKelurahan = null;
    getListKecamatan();
  }

  late final _selectedKecamatan = Rx<KecamatanModel?>(null);
  KecamatanModel? get selectedKecamatan => _selectedKecamatan.value;
  set selectedKecamatan(KecamatanModel? value) {
    _selectedKecamatan.value = value;

    selectedKelurahan = null;
    getListKelurahan();
  }

  late final _selectedKelurahan = Rx<KelurahanModel?>(null);
  KelurahanModel? get selectedKelurahan => _selectedKelurahan.value;
  set selectedKelurahan(KelurahanModel? value) {
    _selectedKelurahan.value = value;
  }

  final _listKabupaten = ResultModel<List<KabupatenModel>>.initial().obs;
  ResultModel<List<KabupatenModel>> get listKabupaten => _listKabupaten.value;
  set listKabupaten(ResultModel<List<KabupatenModel>> value) =>
      _listKabupaten.value = value;

  final _listKecamatan = ResultModel<List<KecamatanModel>>.initial().obs;
  ResultModel<List<KecamatanModel>> get listKecamatan => _listKecamatan.value;
  set listKecamatan(ResultModel<List<KecamatanModel>> value) =>
      _listKecamatan.value = value;

  final _listKelurahan = ResultModel<List<KelurahanModel>>.initial().obs;
  ResultModel<List<KelurahanModel>> get listKelurahan => _listKelurahan.value;
  set listKelurahan(ResultModel<List<KelurahanModel>> value) =>
      _listKelurahan.value = value;

  void getListKabupaten() {
    listKabupaten = ResultModel.loading();
    datasource.getListKabupaten().then((value) {
      listKabupaten = ResultModel.success(value);
    }).catchError((e) {
      listKabupaten = ResultModel.error(e);
    });
  }

  void getListKecamatan() {
    if (selectedKabupaten == null) return;

    listKecamatan = ResultModel.loading();
    datasource.getListKecamatan(selectedKabupaten!.id).then((value) {
      listKecamatan = ResultModel.success(value);
    }).catchError((e) {
      listKecamatan = ResultModel.error(e);
    });
  }

  void getListKelurahan() {
    if (selectedKecamatan == null) return;

    listKelurahan = ResultModel.loading();
    datasource.getListKelurahan(selectedKecamatan!.id).then((value) {
      listKelurahan = ResultModel.success(value);
    }).catchError((e) {
      listKelurahan = ResultModel.error(e);
    });
  }

  void submit() {
    if (!formKey.currentState!.validate()) return;

    profileController.newKelurahanId = selectedKelurahan!.id;
    profileController.alamatController.text = '${selectedKabupaten!.nama}, ${selectedKecamatan!.nama}, ${selectedKelurahan!.nama}';
    Get.back();
  }
}
