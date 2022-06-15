import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/helpers/catch_exepton_helper.dart';
import 'package:rick_and_morty_app/screens/auth_screen/bloc/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AutorizationInitial()) {
    on<AuthEvent>((event, emit) {});
    on<AuthSignInEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        await AuthRepository().login(
          login: event.login,
          password: event.password,
        );
        emit(AuthFetchedState());
      } catch (e) {
        emit(AuthErrorState(error: CatchException.convertException(e)));
      }
    });

    on<AuthSignUpEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        await AuthRepository().createUser(
          login: event.login,
          password: event.password,
          name: event.name,
          surname: event.surname,
          patronyMic: event.patronyMic,
        );

        emit(AuthFetchedState());
      } catch (e) {
        emit(AuthErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
