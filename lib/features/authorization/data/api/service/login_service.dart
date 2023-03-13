import 'package:dio/dio.dart';
import 'package:flutter_auth_clean/core/utils/constants/strings.dart';
import 'package:flutter_auth_clean/features/authorization/data/api/request/get_login_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';

import '../../../../../locator.dart';

class LoginService {
  Future<String> login(GetLoginData loginData) async {
    locator<Dio>().interceptors.add(InterceptorsWrapper(
        onError: (DioError error, ErrorInterceptorHandler handler) async {
      if (error.response?.statusCode == 401) {
        final refreshToken =
            locator<FlutterSecureStorage>().read(key: REFRESH_TOKEN);
        final response = await locator<Dio>().post(
          '/token/refresh/',
          data: {'refresh': refreshToken},
        );
        if (response.statusCode == 200) {
          await locator<FlutterSecureStorage>()
              .write(key: ACCESS_TOKEN, value: response.data['access']);
          await locator<FlutterSecureStorage>()
              .write(key: ACCESS_TOKEN, value: response.data['refresh']);
        } else {
          // Handle refresh token request failure
        }
      } else {
        // Handle other errors
      }
    }));
    String message = '';
    try {
      final response =
          await locator<Dio>().post('/api/token/', data: loginData.toApi());
      if (response.statusCode == 200) {
        await locator<FlutterSecureStorage>()
            .write(key: ACCESS_TOKEN, value: response.data['access']);
        await locator<FlutterSecureStorage>()
            .write(key: ACCESS_TOKEN, value: response.data['refresh']);
        message = response.statusMessage!;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        message = e.response?.data['detail'];
      } else {
        message = e.message!;
      }
    }
    return message;
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
