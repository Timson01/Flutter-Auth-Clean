import 'package:dio/dio.dart';
import 'package:flutter_auth_clean/core/utils/constants/strings.dart';
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
}
