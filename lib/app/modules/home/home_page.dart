import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('HomePage')),
        body: SafeArea(child: Text('HomeController')));
  }
}
