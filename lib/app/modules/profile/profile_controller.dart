import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/helpers/dialog_helper.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/models/profile/user_profile_model.dart';
import 'package:history_hub_v2/app/data/models/result_model.dart';
import 'package:history_hub_v2/app/data/params/profile/edit_user_profile_params.dart';

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

    getUserProfile();

    super.onInit();
  }

  final String userId = Get.arguments;

  final _newNama = ''.obs;
  get newNama => _newNama.value;
  set newNama(value) => _newNama.value = value;

  final _newAlamat = ''.obs;
  get newAlamat => _newAlamat.value;
  set newAlamat(value) => _newAlamat.value = value;

  final _newKelurahanId = Rx<int>(-99);
  get newKelurahanId => _newKelurahanId.value;
  set newKelurahanId(value) => _newKelurahanId.value = value;

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

  final _userProfile = ResultModel<UserProfileModel>.initial().obs;
  ResultModel<UserProfileModel> get userProfile => _userProfile.value;
  set userProfile(ResultModel<UserProfileModel> value) =>
      _userProfile.value = value;

  void getUserProfile() {
    userProfile = ResultModel.loading();
    datasource.getUserProfile(userId).then(
      (value) {
        debugPrint('Sampai Sini');
        userProfile = ResultModel.success(value);
        namaController.text = value.name;
        alamatController.text = value.alamatText;
        newKelurahanId = value.kelurahanId;
        phoneController.text = value.telepon;
      },
    ).catchError((e) {
      userProfile = ResultModel.error(e);
    });
  }

  void editUserProfile() {
    FocusScope.of(Get.context!).unfocus();
    DialogHelper.showLoading();
    datasource
        .editUserProfile(
      EditUserProfileParams(
        image: newProfileImage,
        name: namaController.text,
        telepon: phoneController.text,
        kelurahanId: newKelurahanId ?? userProfile.data!.kelurahanId,
        userId: userId,
      ),
    )
        .then((value) {
      DialogHelper.dismiss();
      userProfile = ResultModel.success(value);
      Get.back();
    }).catchError((e) {
      DialogHelper.showError(e.toString());
    });
  }
}
