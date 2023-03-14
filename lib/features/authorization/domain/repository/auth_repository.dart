import 'dart:io';

abstract class AuthRepository {
  Future<int> login({required String username, required String password});
  Future<void> logout();
  Future<bool> isAuthenticated();
}
