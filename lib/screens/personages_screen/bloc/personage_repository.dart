import 'package:rick_and_morty_app/screens/personages_screen/bloc/personage_provider.dart';
import 'package:rick_and_morty_app/models/character_model.dart';

class UserRaepository {
  Future<List<CharacterModel>> getCharacter() {
    UserProvider provider = UserProvider();
    return provider.getCharacter();
  }
}
