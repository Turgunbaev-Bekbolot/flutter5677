import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/helpers/api_requester.dart';
import 'package:rick_and_morty_app/helpers/catch_exepton_helper.dart';
import 'package:rick_and_morty_app/models/epizod_model.dart';

class EpizodProvider {
  Future<List<EpizodModel>> getEpizod() async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toGet(
        '/episode',
      );
      log(response.data.toString());
      if (response.statusCode == 200) {
        List<EpizodModel> locationModelList = response.data['results']
            .map<EpizodModel>((el) => EpizodModel.fromJson(el))
            .toList();
        return locationModelList;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      print("231 $e");
      throw CatchException.convertException(e);
    }
  }
}
