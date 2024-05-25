import 'package:history_hub/src/core/data/datasources/remote/app_remote_datasources_provider.dart';
import 'package:history_hub/src/core/data/models/app_result.dart';
import 'package:history_hub/src/core/data/models/app_user.dart';
import 'package:history_hub/src/core/helper/dialog_helper.dart';
import 'package:history_hub/src/features/login/presentation/providers/current_user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginControllerProvider = Provider<LoginController>((ref) {
  return LoginController(ref.read(appRemoteDatasourcesProvider), ref);
});

class LoginController {
  final AppRemoteDatasources _remoteDatasources;
  final Ref _ref;
  LoginController(this._remoteDatasources, this._ref);

  final _loginState = StateProvider<AppResult<AppUser>>((ref) {
    return AppResult.initial();
  });
  AppResult<AppUser> get loginState => _ref.watch(_loginState);
  set loginState(AppResult<AppUser> value) =>
      _ref.read(_loginState.notifier).state = value;

  Future<bool> login(String email, String password) async {
    loginState = AppResult.loading();
    DialogHelper.showLoading();

    final (err, user) = await _remoteDatasources.login(email, password);
    DialogHelper.dismiss();

    if (err != null) {
      loginState = AppResult.error(err);
      DialogHelper.showError(err.message);
      return false;
    }

    loginState = AppResult.success(user!);
    _ref.read(currentUserProvider.notifier).login(user);
    return true;
  }
}
