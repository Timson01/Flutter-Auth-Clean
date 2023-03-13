part of 'auth_bloc.dart';

abstract class AuthEvent {}

class CheckAuthStatusEvent extends AuthEvent {}

class AuthUserEvent extends AuthEvent {
  final String username;
  final String password;

  AuthUserEvent({required this.username, required this.password});
}

class LogoutEvent extends AuthEvent {}
