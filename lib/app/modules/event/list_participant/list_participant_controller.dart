import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/helpers/dialog_helper.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/models/event/event_participant_model.dart';
import 'package:history_hub_v2/app/data/models/result_model.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ListParticipantController extends GetxController {
  final AppDatasource datasource;
  ListParticipantController(this.datasource);

  @override
  void onInit() {
    queryCtrl.addListener(
      () {
        queryParticipant = queryCtrl.text;
      },
    );

    debounce(
      _queryParticipant,
      (callback) {
        getListEventParticipant();
      },
      time: const Duration(seconds: 1),
    );

    getListEventParticipant();
    super.onInit();
  }

  void scanQr() {
    Get.dialog(
      QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 0.7.sw,
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    double scanCount = 0;
    controller.scannedDataStream.listen((scanData) {
      scanCount += 1;
      if (scanCount == 1) {
        Get.back();
        if (scanData.code != null) {
          checkIn(scanData.code!);
        }
      }
    });
  }

  void checkIn(String orderId) {
    DialogHelper.showLoading();
    datasource.checkIn(orderId).then((_) {
      DialogHelper.dismiss();
      DialogHelper.showSuccess('Sukses Check-In');
      getListEventParticipant();
    }).catchError((e) {
      DialogHelper.dismiss();
      DialogHelper.showError('Gagal Check-In: ${e.toString()}');
    });
  }

  final _qrString = ''.obs;
  get qrString => _qrString.value;
  set qrString(value) => _qrString.value = value;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  final queryCtrl = TextEditingController();

  final _queryParticipant = ''.obs;
  String get queryParticipant => _queryParticipant.value;
  set queryParticipant(String value) => _queryParticipant.value = value;

  final eventId = Get.arguments;

  final _listParticipant =
      ResultModel<List<EventParticipantModel>>.initial().obs;
  ResultModel<List<EventParticipantModel>> get listParticipant =>
      _listParticipant.value;
  set listParticipant(ResultModel<List<EventParticipantModel>> value) =>
      _listParticipant.value = value;

  void getListEventParticipant() {
    listParticipant = ResultModel.loading();
    datasource.getListEventParticipant(eventId, queryParticipant).then((value) {
      listParticipant = ResultModel.success(value);
    }).catchError((e) {
      listParticipant = ResultModel.error(Exception(e.toString()));
    });
  }
}
