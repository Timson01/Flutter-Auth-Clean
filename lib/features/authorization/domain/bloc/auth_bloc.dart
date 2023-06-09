import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    int statusCode = await authRepository.login(
        username: event.username, password: event.password);
    if (statusCode == 200) {
      emit(Authenticated());
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
    emit(Unauthenticated());
    await authRepository.logout();
  }
}
