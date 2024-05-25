import 'package:history_hub/src/core/data/datasources/remote/supabase_datasources.dart';
import 'package:history_hub/src/core/data/models/app_user.dart';
import 'package:history_hub/src/core/data/models/kabupaten.dart';
import 'package:history_hub/src/core/data/models/kecamatan.dart';
import 'package:history_hub/src/core/data/models/kelurahan.dart';
import 'package:history_hub/src/core/data/models/params/register_user_params.dart';
import 'package:history_hub/src/core/error/app_failure.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appRemoteDatasourcesProvider =
    Provider<AppRemoteDatasources>((ref) => SupabaseDatasources());

abstract class AppRemoteDatasources {
  // Auth
  Future<(AppFailure?, void)> registerUser(RegisterUserParams params);
  Future<(AppFailure?, AppUser?)> login(String email, String password);
  Future<(AppFailure?, List<Kabupaten>?)> getListKabupaten();
  Future<(AppFailure?, List<Kecamatan>?)> getListKecamatan(int kabupatedId);
  Future<(AppFailure?, List<Kelurahan>?)> getListKelurahan(int kecamatanId);
}
