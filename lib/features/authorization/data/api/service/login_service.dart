import 'package:dio/dio.dart';
import 'package:flutter_auth_clean/features/authorization/data/api/request/get_login_data.dart';

import '../../../../../locator.dart';

class LoginService {
  Future<void> authUser(GetLoginData loginData) async {
    final response =
        await locator<Dio>().post('/api/token/', data: loginData.toApi());
    print(response.data);
  }
}
