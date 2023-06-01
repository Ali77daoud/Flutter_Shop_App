import 'dart:convert';
import 'package:agora_shop/models/HomeData/home_data_model.dart';
import 'package:agora_shop/shared/errors/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_constants.dart';

abstract class HomeApiService {
  Future<HomeDataModel> getHomeDataApi(String token, String lang);
}

class HomeApiServiceImpWithHttp implements HomeApiService {
  final http.Client client;

  HomeApiServiceImpWithHttp({required this.client});
  @override
  Future<HomeDataModel> getHomeDataApi(String token, String lang) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}/home');

    final response = await client.get(uri, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token,
      'lang': lang,
    });
    debugPrint('1');
    debugPrint(response.statusCode.toString());
    if (response.statusCode >= 200 && response.statusCode < 300) {
      debugPrint('2');
      final data = jsonDecode(response.body);
      if (data['status'] == true) {
        debugPrint('logIn success');
        final resposeData = HomeDataModel.fromJson(data['data']);
        return resposeData;
      } else {
        debugPrint('logIn field');
        throw ServerException();
      }
    } else {
      debugPrint('3');
      throw ServerException();
    }
  }
}
