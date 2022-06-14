part of 'epizod_bloc.dart';

@immutable
abstract class EpizodState {}

class EpizodInitial extends EpizodState {}

class EpizodLoadingState extends EpizodState {}

class EpizodFetchedState extends EpizodState {
  final List<EpizodModel>? epizodModel;

  EpizodFetchedState({this.epizodModel});
}

class EpizodErrorState extends EpizodState {
  final CatchException? error;

  EpizodErrorState({this.error});
}
