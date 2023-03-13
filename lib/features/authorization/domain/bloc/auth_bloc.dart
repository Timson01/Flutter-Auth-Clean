import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_clean/features/authorization/presentation/utils/login_page_controller.dart';

import '../repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<AuthUserEvent>(authUser);
    on<CheckAuthStatusEvent>(checkAuthStatus);
    on<LogoutEvent>(logout);
  }

  Future<void> authUser(AuthUserEvent event, Emitter<AuthState> emit) async {
    String message = await authRepository.login(
        username: event.username, password: event.password);
    if (message == "OK") {
      emit(Authenticated());
    } else {
      LoginPageController.showSnackBar(
          message: message, context: event.context);
    }
  }

  Future<void> checkAuthStatus(
      CheckAuthStatusEvent event, Emitter<AuthState> emit) async {
    final bool hasToken = await authRepository.isAuthenticated();
    if (hasToken) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> logout(LogoutEvent event, Emitter<AuthState> emit) async {
    await authRepository.logout();
  }
}
