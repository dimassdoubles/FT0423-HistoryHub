import 'package:history_hub/src/core/data/datasources/remote/app_remote_datasources_provider.dart';
import 'package:history_hub/src/core/data/models/app_result.dart';
import 'package:history_hub/src/core/data/models/params/register_user_params.dart';
import 'package:history_hub/src/core/helper/dialog_helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final registerControllerProvider = Provider<RegisterController>((ref) {
  return RegisterController(ref.read(appRemoteDatasourcesProvider), ref);
});

class RegisterController {
  final AppRemoteDatasources _appRemoteDatasources;
  final Ref _ref;
  RegisterController(this._appRemoteDatasources, this._ref);

  final _registerState = StateProvider<AppResult<void>>((ref) {
    return AppResult.initial();
  });
  AppResult<void> get registerState => _ref.watch(_registerState);
  set registerState(AppResult<void> value) =>
      _ref.read(_registerState.notifier).state = value;

  Future<bool> registerUser(RegisterUserParams params) async {
    registerState = AppResult.loading();
    DialogHelper.showLoading();
    // Dialog

    final (err, _) = await _appRemoteDatasources.registerUser(params);
    DialogHelper.dismiss();

    if (err != null) {
      registerState = AppResult.error(err);
      DialogHelper.showError(err.message);
      return false;
    }

    registerState = AppResult.success(null);
    return true;
  }
}
