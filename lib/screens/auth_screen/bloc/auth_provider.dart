import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/commands/constans.dart';
import 'package:rick_and_morty_app/helpers/api_requester.dart';
import 'package:rick_and_morty_app/helpers/catch_exepton_helper.dart';

class AuthProvider {
  Future createUser({
    required String lastName,
    required String firstName,
    required String patronyMic,
    required String userName,
    required String password,
  }) async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toPost('/auth/create_user/', body: {
        "last_name": lastName,
        "first_name": firstName,
        "patronymic": patronyMic,
        "username": userName,
        "password": password,
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

  Future login({
    required String userName,
    required String password,
  }) async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toPost('/auth/token/login/', body: {
        "username": userName,
        "password": password,
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        log(response.data.toString());
        Constans.token = response.data['auth_token'];
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
