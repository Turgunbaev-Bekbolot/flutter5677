part of 'personage_bloc.dart';

@immutable
abstract class PersonageState {}

class PersonageInitial extends PersonageState {}

class PersonageLoadingState extends PersonageState {}

class PersonageFetchedState extends PersonageState {
  final List<CharacterModel> characterModel;

  PersonageFetchedState({required this.characterModel});
}

class PersonageErrorState extends PersonageState {
  final CatchException? error;

  PersonageErrorState({this.error});
}
