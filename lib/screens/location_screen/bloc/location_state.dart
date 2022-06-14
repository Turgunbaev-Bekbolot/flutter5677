part of 'location_bloc.dart';

@immutable
abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoadingState extends LocationState {}

class LocationFetchedState extends LocationState {
  final List<LocationModel>? locationModel;

  LocationFetchedState({this.locationModel});
}

class LocationErrorState extends LocationState {
  final CatchException? error;

  LocationErrorState({this.error});
}
