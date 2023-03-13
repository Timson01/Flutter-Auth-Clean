abstract class AuthRepository {
  Future<String> login({required String username, required String password});
  Future<void> logout();
  Future<bool> isAuthenticated();
}
