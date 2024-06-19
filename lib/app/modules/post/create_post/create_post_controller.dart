import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/helpers/dialog_helper.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/params/post/create_post_params.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';
import 'package:history_hub_v2/app/modules/home/home_page.dart';

class CreatePostController extends GetxController {
  final AppDatasource _datasource;
  CreatePostController(this._datasource);

  @override
  void onInit() {
    debugPrint('init CreatePostController');
    super.onInit();
  }

  final _selectedImage = Rx<File?>(null);
  File? get selectedImage => _selectedImage.value;
  set selectedImage(File? value) {
    _selectedImage.value = value;
  }

  final contentController = TextEditingController();

  void createPost() async {
    FocusScope.of(Get.context!).unfocus();
    DialogHelper.showLoading();
    _datasource
        .createPost(
      CreatePostParams(
        userId: Get.find<HomeController>().currentUser!.id,
        content: contentController.text,
        image: selectedImage,
      ),
    )
        .then((value) {
      DialogHelper.dismiss();
      DialogHelper.showSuccess('Berhsail membuat postingan baru');
      Get.until((route) => Get.currentRoute == HomePage.routeName);
    }).catchError((e) {
      DialogHelper.dismiss();
      DialogHelper.showError('Gagal membuat postingan: ${e.toString()}');
    });
  }
}
