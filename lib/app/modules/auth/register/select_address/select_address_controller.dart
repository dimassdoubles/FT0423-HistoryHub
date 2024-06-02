import 'package:get/get.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/models/auth/kabupaten_model.dart';
import 'package:history_hub_v2/app/data/models/auth/kecamatan_model.dart';
import 'package:history_hub_v2/app/data/models/auth/kelurahan_model.dart';
import 'package:history_hub_v2/app/data/models/result_model.dart';
import 'package:history_hub_v2/app/modules/auth/register/register_controller.dart';

class SelectAddressController extends GetxController {
  final AppDatasource datasource;
  final RegisterController registerController;
  SelectAddressController(this.datasource, this.registerController);

  @override
  void onInit() {
    getListKabupaten();
    super.onInit();
  }

  late final _selectedKabupaten =
      Rx<KabupatenModel?>(registerController.selectedKabupaten);
  get selectedKabupaten => _selectedKabupaten.value;
  set selectedKabupaten(value) {
    _selectedKabupaten.value = value;
    selectedKecamatan = null;
    selectedKelurahan = null;
    getListKecamatan();
  }

  late final _selectedKecamatan =
      Rx<KecamatanModel?>(registerController.selectedKecamatan);
  get selectedKecamatan => _selectedKecamatan.value;
  set selectedKecamatan(value) {
    _selectedKecamatan.value = value;
    selectedKelurahan = null;
    getListKelurahan();
  }

  late final _selectedKelurahan =
      Rx<KelurahanModel?>(registerController.selectedKelurahan);
  get selectedKelurahan => _selectedKelurahan.value;
  set selectedKelurahan(value) {
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

  void getListKecamatan() {}
  void getListKelurahan() {}

  void submit() {}
}
