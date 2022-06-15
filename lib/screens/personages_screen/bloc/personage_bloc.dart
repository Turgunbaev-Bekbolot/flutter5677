import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/helpers/catch_exepton_helper.dart';
import 'package:rick_and_morty_app/models/character_model.dart';
import 'package:rick_and_morty_app/screens/personages_screen/bloc/personage_repository.dart';

part 'personage_event.dart';
part 'personage_state.dart';

class PersonageBloc extends Bloc<PersonageEvent, PersonageState> {
  PersonageBloc() : super(PersonageInitial()) {
    on<GetPersonageEvent>((event, emit) async {
      emit(PersonageLoadingState());
      try {
        List<CharacterModel> characterModelList =
            await UserRaepository().getCharacter();

        emit(PersonageFetchedState(characterModel: characterModelList));
      } catch (e) {
        emit(PersonageErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
