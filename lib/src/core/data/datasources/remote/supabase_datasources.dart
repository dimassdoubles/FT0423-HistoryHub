import 'package:history_hub/src/core/data/datasources/remote/app_remote_datasources.dart';
import 'package:history_hub/src/core/data/models/app_user.dart';
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
        'full_name': params.fullName,
        'email': params.email,
        'phone_number': params.phoneNumber,
        'address': params.address,
        'avatar_url': '',
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
}
