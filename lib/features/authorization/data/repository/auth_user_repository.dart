import 'package:flutter_auth_clean/features/authorization/data/api_util.dart';
import 'package:flutter_auth_clean/features/authorization/domain/repository/auth_repository.dart';

class AuthUserRepository implements AuthRepository {
  final ApiUtil _apiUtil;

  AuthUserRepository(this._apiUtil);

  @override
  Future<void> authUser(
      {required String username, required String password}) async {
    await _apiUtil.authUser(username: username, password: password);
  }
}
