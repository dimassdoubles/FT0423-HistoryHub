import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/helpers/dialog_helper.dart';
import 'package:history_hub_v2/app/data/datasources/app_datasource.dart';
import 'package:history_hub_v2/app/data/models/post/post_model.dart';
import 'package:history_hub_v2/app/data/models/profile/user_profile_model.dart';
import 'package:history_hub_v2/app/data/models/result_model.dart';
import 'package:history_hub_v2/app/data/params/post/get_user_list_post_params.dart';
import 'package:history_hub_v2/app/data/params/profile/edit_user_profile_params.dart';
import 'package:history_hub_v2/app/modules/post/post_controller.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProfileController extends GetxController {
  final AppDatasource datasource;
  ProfileController(this.datasource);

  @override
  void onInit() {
    try {
      Get.find<PostController>().onPageRefresh();
    } catch (_) {}

    namaController.addListener(() {
      newNama = namaController.text;
    });
    alamatController.addListener(() {
      newAlamat = alamatController.text;
    });
    phoneController.addListener(() {
      newTelepon = phoneController.text;
    });

    pagingController.addPageRequestListener((page) async {
      getListPost(page);
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
      try {} catch (_) {}
      Get.back();
    }).catchError((e) {
      DialogHelper.showError(e.toString());
    });
  }

  void updateCommentCounter(PostModel post, int index, int newCommentCount) {
    pagingController.itemList![index] = post.copyWith(
      commentCount: newCommentCount,
    );
  }

  // jika sudah like otomatis unlike
  void like(PostModel post, int index, void Function()? onError) {
    pagingController.itemList![index] = post.copyWith(
        isLikedByMe: !post.isLikedByMe,
        likeCount: post.isLikedByMe ? post.likeCount - 1 : post.likeCount + 1);
    debugPrint('liked: ${pagingController.itemList![index].isLikedByMe}');
    datasource.like(post.id).catchError((e) {
      pagingController.itemList![index] = post;
      debugPrint(
        'unliked bcs error: ${pagingController.itemList![index].isLikedByMe}',
      );
      onError?.call();
    });
  }

  final listKey = const PageStorageKey("list_post_key");

  Future<void> onPageRefresh() async {
    pagingController.refresh();
  }

  final PagingController<int, PostModel> pagingController = PagingController(
    firstPageKey: 0,
  );

  final pageSize = GetUserListPostParams.limit;

  void appendPage(int page, List<PostModel> data) {
    final isLastPage = data.length < pageSize;
    if (isLastPage) {
      pagingController.appendLastPage(data);
    } else {
      pagingController.appendPage(data, page + 1);
    }
  }

  void getListPost(int page) {
    debugPrint('getListPost page: $page');
    datasource
        .getUserListPost(
      GetUserListPostParams(
        keyword: '',
        listTagId: [],
        offset: page,
      ),
    )
        .then((value) {
      appendPage(page, value);
    }).catchError((e) {
      pagingController.error = e;
    });
  }
}
