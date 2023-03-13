import 'package:flutter_auth_clean/features/authorization/data/api_util.dart';
import 'package:flutter_auth_clean/features/authorization/domain/repository/auth_repository.dart';

class AuthUserRepositoryImpl implements AuthRepository {
  final ApiUtil _apiUtil;

  AuthUserRepositoryImpl(this._apiUtil);

  @override
  Future<String> login(
      {required String username, required String password}) async {
    return await _apiUtil.login(username: username, password: password);
  }

  @override
  Future<bool> isAuthenticated() async {
    return _apiUtil.isAuthenticated();
  }

  @override
  Future<void> logout() async {
    await _apiUtil.logout();
  }
}
