import 'package:flutter/material.dart';
import 'package:history_hub/src/core/constants/tables.dart';
import 'package:history_hub/src/core/data/datasources/remote/app_remote_datasources.dart';
import 'package:history_hub/src/core/data/models/app_user.dart';
import 'package:history_hub/src/core/data/models/kabupaten.dart';
import 'package:history_hub/src/core/data/models/kecamatan.dart';
import 'package:history_hub/src/core/data/models/kelurahan.dart';
import 'package:history_hub/src/core/data/models/params/register_user_params.dart';
import 'package:history_hub/src/core/error/app_failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDatasources implements AppRemoteDatasources {
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

      // response to AppUser
      final userProfile = await _supabaseClient
          .from('user_profiles')
          .select()
          .eq('user_id', response.user!.id);

      // convert userProfile to AppUser
      final appUser = AppUser.fromJson(userProfile.first);

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
}
