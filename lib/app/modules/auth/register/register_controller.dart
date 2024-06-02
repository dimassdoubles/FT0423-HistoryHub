import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/helpers/dialog_helper.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/models/auth/kabupaten_model.dart';
import 'package:history_hub_v2/app/data/models/auth/kecamatan_model.dart';
import 'package:history_hub_v2/app/data/models/auth/kelurahan_model.dart';
import 'package:history_hub_v2/app/data/params/auth/register_user_params.dart';
import 'package:history_hub_v2/app/modules/auth/register/select_address/select_address_page.dart';

class RegisterController extends GetxController {
  final AppDatasource datasource;
  RegisterController(this.datasource);

  final formKey = GlobalKey<FormState>();

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

    controllerAlamat.text =
        "${selectedKabupaten.nama}, ${selectedKecamatan.nama}, ${selectedKecamatan.nama}";
  }

  void register() {
    FocusScope.of(Get.context!).unfocus();
    if (!formKey.currentState!.validate()) return;

    DialogHelper.showLoading();
    datasource
        .registerUser(
      RegisterUserParams(
        password: controllerPassword.text,
        fullName: controllerNama.text,
        phoneNumber: controllerPhone.text,
        email: controllerEmail.text,
        kabupatenId: selectedKabupaten.id,
        kecamatanId: selectedKecamatan.id,
        kelurahanId: selectedKelurahan.id,
      ),
    )
        .then((value) {
      DialogHelper.dismiss();
      DialogHelper.showSuccess(
          'Pendaftaran berhasil, silahkan cek email anda untuk melakukan konfirmasi');
      Get.back();
    }).catchError((e) {
      DialogHelper.dismiss();
      DialogHelper.showError(e.toString());
    });
  }

  void selectAddress() {
    debugPrint('selectAddress');
    Get.toNamed(SelectAddressPage.routeName);
  }
}
