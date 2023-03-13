import 'package:dio/dio.dart';
import 'package:flutter_auth_clean/core/utils/constants/strings.dart';
import 'package:flutter_auth_clean/features/authorization/data/api/service/login_service.dart';
import 'package:flutter_auth_clean/features/authorization/data/auth_api_util.dart';
import 'package:flutter_auth_clean/features/authorization/data/repository/auth_user_repository_impl.dart';
import 'package:flutter_auth_clean/features/notes/data/api/service/notes_service.dart';
import 'package:flutter_auth_clean/features/notes/data/notes_api_util.dart';
import 'package:flutter_auth_clean/features/notes/data/repository/notes_repository_impl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final storage = FlutterSecureStorage();
  locator.registerSingleton<FlutterSecureStorage>(storage);

  final dio = Dio(
    BaseOptions(
      baseUrl: SERVER_IP,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 7),
    ),
  );
  locator.registerSingleton<Dio>(dio);

  final authApiUtil = AuthApiUtil(LoginService());
  locator.registerSingleton<AuthApiUtil>(authApiUtil);

  locator.registerSingleton<AuthUserRepositoryImpl>(
      AuthUserRepositoryImpl(locator<AuthApiUtil>()));

  final notesApiUtil = NotesApiUtil(NotesService());
  locator.registerSingleton<NotesApiUtil>(notesApiUtil);

  locator.registerSingleton<NotesRepositoryImpl>(
      NotesRepositoryImpl(locator<NotesApiUtil>()));
}
