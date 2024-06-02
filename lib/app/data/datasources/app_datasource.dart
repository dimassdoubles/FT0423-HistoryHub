import 'package:history_hub_v2/app/core/constants/supabase/sp_functions.dart';
import 'package:history_hub_v2/app/data/datasources/local_datasource.dart';
import 'package:history_hub_v2/app/data/models/auth/kabupaten_model.dart';
import 'package:history_hub_v2/app/data/models/auth/kecamatan_model.dart';
import 'package:history_hub_v2/app/data/models/auth/kelurahan_model.dart';
import 'package:history_hub_v2/app/data/models/auth/user_model.dart';
import 'package:history_hub_v2/app/data/models/post/post_model.dart';
import 'package:history_hub_v2/app/data/params/auth/register_user_params.dart';
import 'package:history_hub_v2/app/data/params/event/create_event_params.dart';
import 'package:history_hub_v2/app/data/params/post/create_post_params.dart';
import 'package:history_hub_v2/app/data/params/post/get_list_post_params.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AppDatasource {
  // auth
  Future<void> registerUser(RegisterUserParams params);
  Future<UserModel> login(String email, String password);
  Future<List<KabupatenModel>> getListKabupaten();
  Future<List<KecamatanModel>> getListKecamatan(int kabupatedId);
  Future<List<KelurahanModel>> getListKelurahan(int kecamatanId);
  Future<UserModel?> getCurrentUser();

  // post
  Future<List<PostModel>> getListPost(GetListPostParams params);
  Future<void> createPost(CreatePostParams params);

  // event
  Future<void> createEvent(CreateEventParams params);
}

class AppDatasourceImpl implements AppDatasource {
  final LocalDatasource _localDatasource;

  AppDatasourceImpl(this._localDatasource) {
    _supabaseClient = Supabase.instance.client;
  }

  late final SupabaseClient _supabaseClient;

  @override
  Future<void> createEvent(CreateEventParams params) {
    // TODO: implement createEvent
    throw UnimplementedError();
  }

  @override
  Future<void> createPost(CreatePostParams params) {
    // TODO: implement createPost
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<List<KabupatenModel>> getListKabupaten() {
    // TODO: implement getListKabupaten
    throw UnimplementedError();
  }

  @override
  Future<List<KecamatanModel>> getListKecamatan(int kabupatedId) {
    // TODO: implement getListKecamatan
    throw UnimplementedError();
  }

  @override
  Future<List<KelurahanModel>> getListKelurahan(int kecamatanId) {
    // TODO: implement getListKelurahan
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getListPost(GetListPostParams params) {
    // TODO: implement getListPost
    throw UnimplementedError();
  }

  @override
  Future<UserModel> login(
    String email,
    String password,
  ) async {
    await _supabaseClient.auth
        .signInWithPassword(email: email, password: password);
    final userProfile = await _supabaseClient.rpc(SpFunctions.getUserProfile);
    return UserModel.fromJson(userProfile.first);
  }

  @override
  Future<void> registerUser(RegisterUserParams params) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }
}
