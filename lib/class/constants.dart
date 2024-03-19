class AuthWS {
  static const String baseUrl = 'http://10.0.2.2:8000/auth';
  static const String login = '/login';
  static const String refreshToken = '/refreshtoken';
}

class UserWS {
  static const String baseUrl = 'http://10.0.2.2:8000/user';
  static const String createUser = '/createuser';
  static const String updateUser = '/updateUser';
}
