import 'package:flutter/material.dart';
import 'package:history_hub/src/core/constants/functions.dart';
import 'package:history_hub/src/core/constants/tables.dart';
import 'package:history_hub/src/core/data/datasources/remote/app_remote_datasources_provider.dart';
import 'package:history_hub/src/core/data/models/app_user.dart';
import 'package:history_hub/src/core/data/models/kabupaten.dart';
import 'package:history_hub/src/core/data/models/kecamatan.dart';
import 'package:history_hub/src/core/data/models/kelurahan.dart';
import 'package:history_hub/src/core/data/models/params/create_post_params.dart';
import 'package:history_hub/src/core/data/models/params/get_post_params.dart';
import 'package:history_hub/src/core/data/models/params/register_user_params.dart';
import 'package:history_hub/src/core/error/app_failure.dart';
import 'package:history_hub/src/features/login/presentation/providers/current_user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supabase_datasources_provider.g.dart';

@Riverpod(keepAlive: true)
class SupabaseDatasources extends _$SupabaseDatasources
    implements AppRemoteDatasources {
  @override
  SupabaseDatasources build() {
    return SupabaseDatasources();
  }

  late final SupabaseClient _supabaseClient;

  SupabaseDatasources() {
    _supabaseClient = Supabase.instance.client;
  }

  @override
  Future<(AppFailure?, void)> registerUser(RegisterUserParams params) async {
    try {
      final response = await _supabaseClient.auth.signUp(
        email: params.email,
        password: params.password,
      );

      final userId = response.user!.id;

      final (err, _) = await _createUserProfile(params, userId);

      if (err != null) {
        return (err, null);
      }

      return (null, null);
    } catch (e) {
      return (AppFailure(e.toString()), null);
    }
  }

  Future<(AppFailure?, void)> _createUserProfile(
      RegisterUserParams params, String userId) async {
    try {
      await _supabaseClient.from('user_profiles').insert({
        'user_id': userId,
        ...params.toMap(),
      });

      return (null, null);
    } catch (e) {
      return (AppFailure(e.toString()), null);
    }
  }

  @override
  Future<(AppFailure?, AppUser?)> login(String email, String password) async {
    try {
      final response = await _supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final query = '''
        SELECT 
        A.id,
        A.user_id,
        A.full_name,
        A.email,
        A.phone_number,
        A.avatar_url,
        B.nama as nama_kabupaten,
        C.nama as nama_kecamatan,
        D.nama as nama_kelurahan
        FROM ${Tables.userProfile} AS A
        JOIN ${Tables.kabupaten} AS B ON A.id_kabupaten = B.id
        JOIN ${Tables.kecamatan} AS C ON A.id_kecamatan = C.id
        JOIN ${Tables.kelurahan} AS D ON A.id_kelurahan = D.id
        WHERE A.user_id = '${response.user!.id}'
        ORDER BY
        A.created_at
      ''';

      final userProfile = await _supabaseClient
          .rpc(Functions.executeSql, params: {'query': query});

      // convert userProfile to AppUser
      debugPrint('sampai sini');
      final appUser = AppUser.fromJson(userProfile.first);
      debugPrint('harusnya ga sampai sini');

      return (null, appUser);
    } catch (e) {
      return (AppFailure(e.toString()), null);
    }
  }

  @override
  Future<(AppFailure?, List<Kabupaten>?)> getListKabupaten() async {
    try {
      final response = await _supabaseClient.from(Tables.kabupaten).select();
      return (null, response.map((json) => Kabupaten.fromJson(json)).toList());
    } catch (e) {
      return (AppFailure(e.toString()), null);
    }
  }

  @override
  Future<(AppFailure?, List<Kecamatan>?)> getListKecamatan(
    int kabupatedId,
  ) async {
    try {
      final response = await _supabaseClient.from(Tables.kecamatan).select().eq(
            'id_kabupaten',
            kabupatedId,
          );
      return (null, response.map((json) => Kecamatan.fromJson(json)).toList());
    } catch (e) {
      debugPrint('error: ${e.toString()}');
      return (AppFailure(e.toString()), null);
    }
  }

  @override
  Future<(AppFailure?, List<Kelurahan>?)> getListKelurahan(
    int kecamatanId,
  ) async {
    try {
      final response = await _supabaseClient.from(Tables.kelurahan).select().eq(
            'id_kecamatan',
            kecamatanId,
          );
      return (null, response.map((json) => Kelurahan.fromJson(json)).toList());
    } catch (e) {
      return (AppFailure(e.toString()), null);
    }
  }

  @override
  Future<(AppFailure?, void)> createPost(
    CreatePostParams params,
  ) async {
    try {
      // TODO upload gambar postingan

      await _supabaseClient.from(Tables.post).insert({
        "user_id": ref.read(currentUserProvider)!.id,
        "image_url": "",
        ...params.toMap(),
      });

      return (null, null);
    } catch (e) {
      return (AppFailure(e.toString()), null);
    }
  }

  @override
  Future<(AppFailure?, void)> getPost(GetPostParams params) {
    // TODO: implement getPost
    throw UnimplementedError();
  }
}
