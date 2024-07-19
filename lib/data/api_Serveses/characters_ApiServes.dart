import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/characters.dart';

import '../../constants/strings.dart';

class characterWebServes {
  late Dio dio;

  characterWebServes() {
    BaseOptions options = BaseOptions(
      baseUrl: baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> GetAllCaracters() async {
    try {
      Response response = await dio.get(baseURL);
      // final characters = await response.data["results"];

      //  print(response.data["results"]);
      print((response.data["results"][0]));
      print("*****************************************");
      //  print(characters);

      return response.data["results"];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
