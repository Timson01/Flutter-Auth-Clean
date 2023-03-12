import 'package:dio/dio.dart';
import 'package:flutter_auth_clean/core/utils/constants/strings.dart';
import 'package:flutter_auth_clean/features/authorization/data/api/service/login_service.dart';
import 'package:flutter_auth_clean/features/authorization/data/api_util.dart';
import 'package:flutter_auth_clean/features/authorization/data/repository/auth_user_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final storage = FlutterSecureStorage();
  locator.registerSingleton<FlutterSecureStorage>(storage);

  final dio = Dio(
    BaseOptions(baseUrl: SERVER_IP),
  );
  locator.registerSingleton<Dio>(dio);

  final apiUtil = ApiUtil(LoginService());
  locator.registerSingleton<ApiUtil>(apiUtil);

  locator.registerSingleton<AuthUserRepository>(
      AuthUserRepository(locator<ApiUtil>()));
}
