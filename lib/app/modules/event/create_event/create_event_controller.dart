import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/helpers/dialog_helper.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/params/event/create_event_params.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';
import 'package:history_hub_v2/app/modules/home/home_page.dart';

class CreateEventController extends GetxController {
  final AppDatasource _datasource;
  CreateEventController(this._datasource);

  final nameCtrl = TextEditingController();
  final deskripsiCtrl = TextEditingController();
  final jumlahTicketCtrl = TextEditingController();
  final hargaCtrl = TextEditingController(text: '0');
  final tanggalJualCtrl = TextEditingController();
  final lokasiCtrl = TextEditingController();

  final _image = Rx<File?>(null);
  File? get image => _image.value;
  set image(File? value) => _image.value = value;

  final _tanggalMulaiEvent = Rx<DateTime?>(null);
  DateTime? get tanggalMulaiEvent => _tanggalMulaiEvent.value;
  set tanggalMulaiEvent(DateTime? value) => _tanggalMulaiEvent.value = value;

  final _tanggalAkhirEvent = Rx<DateTime?>(null);
  DateTime? get tanggalAkhirEvent => _tanggalAkhirEvent.value;
  set tanggalAkhirEvent(DateTime? value) => _tanggalAkhirEvent.value = value;

  final _tanggalMulaiJual = Rx<DateTime?>(null);
  DateTime? get tanggalMulaiJual => _tanggalMulaiJual.value;
  set tanggalMulaiJual(DateTime? value) => _tanggalMulaiJual.value = value;

  final _tanggalAkhirJual = Rx<DateTime?>(null);
  DateTime? get tanggalAkhirJual => _tanggalAkhirJual.value;
  set tanggalAkhirJual(DateTime? value) => _tanggalAkhirJual.value = value;

  final _jamMulaiEvent = Rx<TimeOfDay?>(null);
  TimeOfDay? get jamMulaiEvent => _jamMulaiEvent.value;
  set jamMulaiEvent(TimeOfDay? value) => _jamMulaiEvent.value = value;

  final _jamAkhirEvent = Rx<TimeOfDay?>(null);
  TimeOfDay? get jamAkhirEvent => _jamAkhirEvent.value;
  set jamAkhirEvent(TimeOfDay? value) => _jamAkhirEvent.value = value;

  void createEvent() {
    FocusScope.of(Get.context!).unfocus();
    DialogHelper.showLoading();
    _datasource
        .createEvent(
      CreateEventParams(
        userId: Get.find<HomeController>().currentUser!.id,
        image: image,
        nama: nameCtrl.text,
        tanggalMulai: tanggalMulaiEvent!,
        tanggalAkhir: tanggalAkhirEvent,
        jamMulai: jamMulaiEvent!,
        jamAkhir: jamAkhirEvent!,
        lokasi: lokasiCtrl.text,
        jumlahTiket: int.parse(jumlahTicketCtrl.text),
        hargaTiket: int.parse(hargaCtrl.text.replaceAll('.', '')),
        tanggalMulaiJual: tanggalMulaiJual!,
        tanggalAkhirJual: tanggalAkhirJual!,
      ),
    )
        .then((value) {
      DialogHelper.dismiss();
      DialogHelper.showSuccess('Berhasil membuat event baru');
      Get.until((route) => Get.currentRoute == HomePage.routeName);
    }).catchError((e) {
      DialogHelper.dismiss();
      DialogHelper.showError('Gagal membuat event: ${e.toString()}');
    });
  }
}
