import 'package:rick_and_morty_app/screens/auth_screen/bloc/auth_provider.dart';

class AuthRepository {
  createUser({
    required String name,
    required String surname,
    required String patronyMic,
    required String login,
    required String password,
  }) {
    AuthProvider provider = AuthProvider();
    provider.createUser(
      firstName: name,
      lastName: surname,
      password: password,
      patronyMic: patronyMic,
      userName: password,
    );
    return "";
  }

  login({
    required String login,
    required String password,
  }) {
    AuthProvider provider = AuthProvider();

    return provider.login(
      password: password,
      userName: login,
    );
  }
}
