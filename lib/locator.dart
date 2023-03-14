import 'package:dio/dio.dart';
import 'package:flutter_auth_clean/core/data/service/http_service.dart';
import 'package:flutter_auth_clean/features/authorization/data/api/service/login_service.dart';
import 'package:flutter_auth_clean/features/authorization/data/repository/auth_repository_impl.dart';
import 'package:flutter_auth_clean/features/notes/data/api/service/notes_service.dart';
import 'package:flutter_auth_clean/features/notes/data/repository/notes_repository_impl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final storage = FlutterSecureStorage();
  locator.registerSingleton<FlutterSecureStorage>(storage);

  final dio = Dio();
  locator.registerSingleton<Dio>(dio);
  HttpService.setupInterceptors();

  locator.registerSingleton<AuthUserRepositoryImpl>(
      AuthUserRepositoryImpl(LoginService()));

  locator.registerSingleton<NotesRepositoryImpl>(
      NotesRepositoryImpl(NotesService()));
}
