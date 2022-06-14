import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/helpers/catch_exepton_helper.dart';

class ApiRequester {
  static String url = 'https://rick-morty-flutter.herokuapp.com/api/v1';
  Future<Dio> initDio() async {
    return Dio(
      BaseOptions(
        baseUrl: url,
        responseType: ResponseType.json,
        receiveTimeout: 30000,
        headers: {
          // "Authorization": "Token e46e88478d06c658a5d9bf9c88ea19816ee7709c"
        },
        connectTimeout: 30000,
      ),
    );
  }

  Future<Response> toGet(String url, {Map<String, dynamic>? param}) async {
    Dio dio = await initDio();
    try {
      return dio.get(url, queryParameters: {}
          // data: jsonEncode(params),
          );
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  Future<Response> toPost(String url,
      {Map<String, dynamic>? param, required Map<String, dynamic> body}) async {
    Dio dio = await initDio();
    try {
      return dio.post(url, queryParameters: param, data: body
          // data: jsonEncode(params),
          );
    } catch (e) {
      log(e.toString());
      throw CatchException.convertException(e);
    }
  }
}