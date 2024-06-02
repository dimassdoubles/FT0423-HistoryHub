import 'package:history_hub_v2/app/data/models/auth/user_model.dart';

abstract class AuthHelper {
  Future<UserModel?> getCurrentUser();
}
