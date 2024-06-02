import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/models/auth/kabupaten_model.dart';
import 'package:history_hub_v2/app/data/models/auth/kecamatan_model.dart';
import 'package:history_hub_v2/app/data/models/auth/kelurahan_model.dart';
import 'package:history_hub_v2/app/modules/auth/register/select_address/select_address_page.dart';

class RegisterController extends GetxController {
  final AppDatasource datasource;
  RegisterController(this.datasource);

  @override
  void onInit() {
    super.onInit();
  }

  // Create focus nodes
  final FocusNode focusNama = FocusNode();
  final FocusNode focusAlamat = FocusNode();
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPhone = FocusNode();
  final FocusNode focusPassword = FocusNode();

  // Create text editing controllers
  final TextEditingController controllerNama = TextEditingController();
  final TextEditingController controllerAlamat = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  final _selectedKabupaten = Rx<KabupatenModel?>(null);
  get selectedKabupaten => _selectedKabupaten.value;
  set selectedKabupaten(value) => _selectedKabupaten.value = value;

  final _selectedKecamatan = Rx<KecamatanModel?>(null);
  get selectedKecamatan => _selectedKecamatan.value;
  set selectedKecamatan(value) => _selectedKecamatan.value = value;

  final _selectedKelurahan = Rx<KelurahanModel?>(null);
  get selectedKelurahan => _selectedKelurahan.value;
  set selectedKelurahan(value) {
    _selectedKelurahan.value = value;
  }

  void register() {}

  void selectAddress() {
    debugPrint('selectAddress');
    Get.toNamed(SelectAddressPage.routeName);
  }
}
