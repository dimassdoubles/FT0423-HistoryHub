import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/modules/auth/login/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  static const routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('LoginPage')),
        body: SafeArea(child: Text('LoginController')));
  }
}
