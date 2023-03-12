import 'package:bloc/bloc.dart';
import 'package:flutter_auth_clean/features/authorization/domain/repository/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<AuthUserEvent>(authUser);
  }

  Future<void> authUser(AuthUserEvent event, Emitter<AuthState> emit) async {
    await authRepository.authUser(
        username: event.username, password: event.password);
  }
}
