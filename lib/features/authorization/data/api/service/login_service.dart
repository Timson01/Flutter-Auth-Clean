import 'package:dio/dio.dart';
import 'package:flutter_auth_clean/core/utils/constants/strings.dart';
import 'package:flutter_auth_clean/features/authorization/data/api/request/get_login_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../../locator.dart';

class LoginService {
  Future<void> login(GetLoginData loginData) async {
    final response =
        await locator<Dio>().post('/api/token/', data: loginData.toApi());
    await locator<FlutterSecureStorage>()
        .write(key: ACCESS_TOKEN, value: response.data['access']);
    await locator<FlutterSecureStorage>()
        .write(key: ACCESS_TOKEN, value: response.data['refresh']);
  }

  Future<bool> isAuthenticated() async {
    final token = await locator<FlutterSecureStorage>().read(key: ACCESS_TOKEN);
    return token != null;
  }

  Future<void> logout() async {
    await locator<FlutterSecureStorage>().delete(key: ACCESS_TOKEN);
    await locator<FlutterSecureStorage>().delete(key: REFRESH_TOKEN);
  }
}
