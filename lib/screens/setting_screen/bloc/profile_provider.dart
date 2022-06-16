import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/helpers/api_requester.dart';
import 'package:rick_and_morty_app/helpers/catch_exepton_helper.dart';

class AuthProvider {
  Future createUser({
  }) async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toPost('/auth/create_user/', body: {
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        log(response.data.toString());
      } else {
        print("!");
        throw CatchException.convertException(response);
      }
    } catch (e) {
      print(e);
      throw CatchException.convertException(e);
    }
  }
}
