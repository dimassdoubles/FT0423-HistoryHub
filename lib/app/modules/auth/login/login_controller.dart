import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/helpers/dialog_helper.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/modules/auth/register/register_page.dart';
import 'package:history_hub_v2/app/modules/home/home_page.dart';

class LoginController extends GetxController {
  final AppDatasource datasource;
  LoginController(this.datasource);

  final formKey = GlobalKey<FormState>();

  final focusEmail = FocusNode();
  final focusPassword = FocusNode();

  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  void checkIsKeyboardOpen() {
    isKeyboardOpen = MediaQuery.of(Get.context!).viewInsets.bottom != 0;
  }

  final _isKeyboardOpen = false.obs;
  get isKeyboardOpen => _isKeyboardOpen.value;
  set isKeyboardOpen(value) => _isKeyboardOpen.value = value;

  void login() {
    if (!formKey.currentState!.validate()) return;

    DialogHelper.showLoading();
    datasource
        .login(controllerEmail.text, controllerPassword.text)
        .then((value) {
      DialogHelper.dismiss();
      Navigator.pushReplacementNamed(Get.context!, HomePage.routeName);
    }).catchError((e) {
      DialogHelper.dismiss();
      DialogHelper.showError(e.toString());
    });
  }

  void forgotPassword() {}

  void register() {
    Get.toNamed(RegisterPage.routeName);
  }
}
