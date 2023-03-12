abstract class AuthRepository {
  Future<void> authUser({required String username, required String password});
}
