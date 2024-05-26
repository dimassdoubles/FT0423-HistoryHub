import 'package:history_hub/src/core/data/models/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrentUser extends _$CurrentUser {
  @override
  AppUser? build() => null;

  void login(AppUser user) {
    state = user;
  }
}
