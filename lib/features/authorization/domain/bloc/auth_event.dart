part of 'auth_bloc.dart';

abstract class AuthEvent {}

class CheckAuthStatusEvent extends AuthEvent {}

class AuthUserEvent extends AuthEvent {
  final String username;
  final String password;
  final BuildContext context;

  AuthUserEvent(
      {required this.username, required this.password, required this.context});
}

class LogoutEvent extends AuthEvent {}
