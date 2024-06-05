import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';

class ProfileController extends GetxController {
  final AppDatasource datasource;
  ProfileController(this.datasource);

  @override
  void onInit() {
    namaController.addListener(() {
      newNama = namaController.text;
    });
    alamatController.addListener(() {
      newAlamat = alamatController.text;
    });
    phoneController.addListener(() {
      newTelepon = phoneController.text;
    });

    super.onInit();
  }

  final _newNama = ''.obs;
  get newNama => _newNama.value;
  set newNama(value) => _newNama.value = value;

  final _newAlamat = ''.obs;
  get newAlamat => _newAlamat.value;
  set newAlamat(value) => _newAlamat.value = value;

  final _newTelepon = ''.obs;
  get newTelepon => _newTelepon.value;
  set newTelepon(value) => _newTelepon.value = value;

  final _newProfileImage = Rx<XFile?>(null);
  XFile? get newProfileImage => _newProfileImage.value;
  set newProfileImage(XFile? value) => _newProfileImage.value = value;

  final namaController = TextEditingController();
  final alamatController = TextEditingController();
  final phoneController = TextEditingController();

  void resetEditState() {
    newProfileImage = null;
  }

  void getListUserPost(int page) {}

  void getListUserLikedPost(int page) {}

  void getUserProfile() {}

  void editUserProfile() {}
}
