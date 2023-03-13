import 'package:flutter_auth_clean/features/authorization/data/api/request/get_login_data.dart';
import 'package:flutter_auth_clean/features/authorization/data/api/service/login_service.dart';

class ApiUtil {
  final LoginService _loginService;

  ApiUtil(this._loginService);

  Future<String> login({
    required String username,
    required String password,
  }) async {
    final loginData = GetLoginData(username: username, password: password);
    return await _loginService.login(loginData);
  }

  Future<bool> isAuthenticated() async {
    return _loginService.isAuthenticated();
  }

  Future<void> logout() async {
    _loginService.logout();
  }
}
