import 'package:dio/dio.dart';
import 'package:flutter_auth_clean/core/presentation/service/snackbar_service.dart';
import 'package:flutter_auth_clean/core/utils/constants/strings.dart';
import 'package:flutter_auth_clean/locator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HttpService {
  static void setupInterceptors() {
    locator<Dio>().interceptors.add(
          InterceptorsWrapper(onRequest: (options, handler) async {
            options.headers.addAll({'Content-Type': 'application/json'});
            options.baseUrl = SERVER_IP;
            String? accessToken =
                await locator<FlutterSecureStorage>().read(key: ACCESS_TOKEN);
            if (accessToken != null) {
              options.headers.addAll({'Authorization': 'JWT $accessToken'});
            }
            return handler.next(options);
          }, onResponse: (response, handler) {
            return handler.next(response);
          }, onError: (error, handler) async {
            SnackBarService.showSnackBar(content: error.message!);
            if (error.response?.statusCode == 401) {
              String? refreshToken = await locator<FlutterSecureStorage>()
                  .read(key: REFRESH_TOKEN);
              if (refreshToken != null) {
                final response = await locator<Dio>().post(
                  '/api/token/refresh/',
                  data: {"refresh": "$refreshToken"},
                );
                if (response.statusCode == 200) {
                  String newAccessToken = response.data['access'];
                  String newRefreshToken = response.data['refresh'];
                  await locator<FlutterSecureStorage>()
                      .write(key: ACCESS_TOKEN, value: newAccessToken);
                  await locator<FlutterSecureStorage>()
                      .write(key: REFRESH_TOKEN, value: newRefreshToken);
                }
              }
              return handler.next(error);
            }
          }),
        );
  }
}
