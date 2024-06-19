import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/models/event/event_participant_model.dart';
import 'package:history_hub_v2/app/data/models/result_model.dart';

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
