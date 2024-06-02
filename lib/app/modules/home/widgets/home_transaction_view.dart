import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';

class HomeTransactionView extends GetView<HomeController> {
  const HomeTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home Transaction View'),
    );
  }
}
