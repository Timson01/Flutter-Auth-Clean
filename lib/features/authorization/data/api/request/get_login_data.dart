class GetLoginData {
  final String username;
  final String password;

  GetLoginData({required this.username, required this.password});

  Map<String, dynamic> toApi() {
    return {'username': username, 'password': password};
  }
}
