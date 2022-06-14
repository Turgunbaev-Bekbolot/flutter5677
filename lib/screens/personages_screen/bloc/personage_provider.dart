import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/helpers/api_requester.dart';
import 'package:rick_and_morty_app/helpers/catch_exepton_helper.dart';
import 'package:rick_and_morty_app/models/character_model.dart';

class UserProvider {
  Future<List<CharacterModel>> getCharacter() async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toGet(
        '/character',
      );
      if (response.statusCode == 200) {
        List<CharacterModel> characterModelList = response.data['results']
            .map<CharacterModel>((el) => CharacterModel.fromJson(el))
            .toList();
        return characterModelList;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      print("231 $e");
      throw CatchException.convertException(e);
    }
  }
}
