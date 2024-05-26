import 'package:history_hub/src/core/data/datasources/remote/supabase_datasources_provider.dart';
import 'package:history_hub/src/core/data/models/app_user.dart';
import 'package:history_hub/src/core/data/models/kabupaten.dart';
import 'package:history_hub/src/core/data/models/kecamatan.dart';
import 'package:history_hub/src/core/data/models/kelurahan.dart';
import 'package:history_hub/src/core/data/models/params/create_post_params.dart';
import 'package:history_hub/src/core/data/models/params/get_post_params.dart';
import 'package:history_hub/src/core/data/models/params/register_user_params.dart';
import 'package:history_hub/src/core/data/models/post_model.dart';
import 'package:history_hub/src/core/constants/error/app_failure.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_remote_datasources_provider.g.dart';

@riverpod
AppRemoteDatasources appRemoteDatasources(AppRemoteDatasourcesRef ref) {
  return ref.read(supabaseDatasourcesProvider);
}

abstract class AppRemoteDatasources {
  // Auth
  Future<(AppFailure?, void)> registerUser(RegisterUserParams params);
  Future<(AppFailure?, AppUser?)> login(String email, String password);
  Future<(AppFailure?, List<Kabupaten>?)> getListKabupaten();
  Future<(AppFailure?, List<Kecamatan>?)> getListKecamatan(int kabupatedId);
  Future<(AppFailure?, List<Kelurahan>?)> getListKelurahan(int kecamatanId);

  // Post
  Future<List<PostModel>> getPost(GetPostParams params);
  Future<(AppFailure?, void)> createPost(CreatePostParams params);
  // Future<(AppFailure?, void)> pinPost();

  // // Event
  // Future<(AppFailure?, void)> getEvent();
  // Future<(AppFailure?, void)> createEvent();
  // Future<(AppFailure?, void)> registerEvent();
  // Future<(AppFailure?, void)> pinEvent();

  // // Members
  // Future<(AppFailure?, void)> getMember();
  // Future<(AppFailure?, void)> acceptMember();
  // Future<(AppFailure?, void)> declineMember();
  // Future<(AppFailure?, void)> kickMember();

  // // Profile
  // Future<(AppFailure?, void)> updateProfile();
}
