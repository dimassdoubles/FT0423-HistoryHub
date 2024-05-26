import 'package:flutter/material.dart';
import 'package:history_hub/src/core/constants/supabase/functions.dart';
import 'package:history_hub/src/core/constants/supabase/supabase_storage.dart';
import 'package:history_hub/src/core/constants/supabase/tables.dart';
import 'package:history_hub/src/core/data/datasources/remote/app_remote_datasources_provider.dart';
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
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as path;

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
      String imageUrl = "";
      const uuid = Uuid();

      if (params.image != null) {
        debugPrint('image path: ${params.image!.path}');

        String fileName =
            "${uuid.v4()}-01${path.extension(params.image!.path)}"; // 01 adalah urutan photo
        debugPrint(fileName);
        final uploadPath = '${params.userId}/$fileName';
        imageUrl = await _supabaseClient.storage
            .from(SupabaseStorage.postBucket)
            .upload(
              uploadPath,
              params.image!,
            );
      }

      await _supabaseClient.from(Tables.post).insert({
        "id": uuid.v4(),
        "image_url": imageUrl,
        ...params.toMap(),
      });

      return (null, null);
    } catch (e) {
      return (AppFailure(e.toString()), null);
    }
  }

  @override
  Future<List<PostModel>> getPost(GetPostParams params) async {
    // TODO cari dan pagination
    final query = '''
      SELECT
          A.id,
          A.user_id,
          A.content,
          A.created_at AS tanggal,
          A.image_url,
          A.list_tag_id,
          B.full_name AS nama_user,
          B.avatar_url AS avatar_user,
          COUNT(DISTINCT C.id) AS like_count,
          COUNT(DISTINCT D.id) AS comment_count,
          EXISTS (
              SELECT 1
              FROM likes AS L
              WHERE L.post_id = A.id AND L.user_id = '${params.myUserId}'
          ) AS is_liked_by_me
      FROM posts AS A
      JOIN user_profiles AS B ON A.user_id = B.user_id
      LEFT JOIN likes AS C ON A.id = C.post_id
      LEFT JOIN comments AS D ON A.id = D.post_id
      GROUP BY
          A.id,
          A.user_id,
          A.content,
          A.created_at,
          A.image_url,
          A.list_tag_id,
          B.full_name,
          B.avatar_url
      ORDER BY A.created_at DESC
      ''';

    final posts = await _supabaseClient
        .rpc(Functions.executeSql, params: {'query': query});

    return List<PostModel>.from(posts.map((json) => PostModel.fromJson(json)));
  }
}
