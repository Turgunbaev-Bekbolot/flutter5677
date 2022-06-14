part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AutorizationInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthFetchedState extends AuthState {}

class AuthErrorState extends AuthState {
  final CatchException error;

  AuthErrorState({required this.error});
}
