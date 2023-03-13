import 'package:flutter_auth_clean/features/authorization/data/auth_api_util.dart';
import 'package:flutter_auth_clean/features/authorization/domain/repository/auth_repository.dart';

class AuthUserRepositoryImpl implements AuthRepository {
  final AuthApiUtil _authApiUtil;

  AuthUserRepositoryImpl(this._authApiUtil);

  @override
  Future<String> login(
      {required String username, required String password}) async {
    return await _authApiUtil.login(username: username, password: password);
  }

  @override
  Future<bool> isAuthenticated() async {
    return _authApiUtil.isAuthenticated();
  }

  @override
  Future<void> logout() async {
    await _authApiUtil.logout();
  }
}
