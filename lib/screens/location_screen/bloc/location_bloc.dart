import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/helpers/catch_exepton_helper.dart';
import 'package:rick_and_morty_app/models/location_model.dart';
import 'package:rick_and_morty_app/screens/location_screen/bloc/location_repository.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<GetLocationEvent>((event, emit) async {
      emit(LocationLoadingState());
      try {
        List<LocationModel> locationModelList =
            await LocationRepository().getLocation();

        emit(LocationFetchedState(locationModel: locationModelList));
      } catch (e) {
        emit(LocationErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
