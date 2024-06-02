import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/modules/auth/register/select_address/select_address_controller.dart';

class SelectAddressPage extends GetView<SelectAddressController> {
  static const routeName = "/select-address";

  const SelectAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('SelectAddressPage')),
        body: SafeArea(child: Text('SelectAddressController')));
  }
}
