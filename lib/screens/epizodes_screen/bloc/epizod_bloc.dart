import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/helpers/catch_exepton_helper.dart';
import 'package:rick_and_morty_app/models/epizod_model.dart';
import 'package:rick_and_morty_app/screens/epizodes_screen/bloc/epizod_repository.dart';

part 'epizod_event.dart';
part 'epizod_state.dart';

class EpizodBloc extends Bloc<EpizodEvent, EpizodState> {
  EpizodBloc() : super(EpizodInitial()) {
    on<GetEpizodEvent>((event, emit) async {
      emit(EpizodLoadingState());
      try {
        List<EpizodModel> epizodModelList =
            await EpizodRaepository().getEpizod();

        emit(EpizodFetchedState(epizodModel: epizodModelList));
      } catch (e) {
        emit(EpizodErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
