import 'package:flutter_auth_clean/features/authorization/domain/repository/auth_repository.dart';

import '../api/request/get_login_data.dart';
import '../api/service/login_service.dart';

class AuthUserRepositoryImpl implements AuthRepository {
  final LoginService _loginService;

  AuthUserRepositoryImpl(this._loginService);

  @override
  Future<int> login(
      {required String username, required String password}) async {
    final loginData = GetLoginData(username: username, password: password);
    return _loginService.login(loginData);
  }

  @override
  Future<bool> isAuthenticated() async {
    return _loginService.isAuthenticated();
  }

  @override
  Future<void> logout() async {
    await _loginService.logout();
  }
}
