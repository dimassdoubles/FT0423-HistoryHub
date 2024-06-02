import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/modules/auth/register/register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  static const routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('RegisterPage')),
        body: SafeArea(child: Text('RegisterController')));
  }
}
