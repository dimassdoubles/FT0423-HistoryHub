import 'package:history_hub_v2/app/data/models/auth/user_model.dart';
import 'package:hive/hive.dart';

abstract class LocalDatasource {
  Future<UserModel?> login(UserModel user);
  UserModel? getCurrentUser();
  bool isLoggedIn();
  Future<void> logout();
}

class HiveDatasource implements LocalDatasource {
  static const boxName = "historyHubBox";
  static const currentUserKey = 'currentUser';

  final box = Hive.box(boxName);

  @override
  UserModel? getCurrentUser() {
    try {
      return UserModel.fromJson(box.get(currentUserKey));
    } catch (_) {
      return null;
    }
  }

  @override
  Future<UserModel?> login(UserModel user) async {
    try {
      box.put(currentUserKey, user.toJson());
      return user;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> logout() {
    return box.delete(currentUserKey);
  }

  @override
  bool isLoggedIn() {
    if (getCurrentUser() != null) {
      return true;
    }
    return false;
  }
}
