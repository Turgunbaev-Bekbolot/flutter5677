part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthSignInEvent extends AuthEvent {
  final String login;
  final String password;

  AuthSignInEvent({required this.login, required this.password});
}

class AuthSignUpEvent extends AuthEvent {
  final String name;
  final String surname;
  final String patronyMic;
  final String login;
  final String password;

  AuthSignUpEvent(
      {required this.name,
      required this.surname,
      required this.patronyMic,
      required this.login,
      required this.password});
}
