import 'dart:convert';
import 'package:agora_shop/controllers/Client/client_controller.dart';
import 'package:agora_shop/models/Favourite/fav_data_model.dart';
import 'package:agora_shop/services/networking/api_constants.dart';
import 'package:agora_shop/shared/errors/exceptions.dart';
import 'package:flutter/material.dart';

abstract class FavApiService {
  Future<FavDataModel> getFavDataApi(String token, String lang);
  Future<String> addOrDeleteFavApi(String token, String lang, int id);
}

class FavApiServiceImpWithHttp implements FavApiService {
  final HttpClientController clientController;

  FavApiServiceImpWithHttp({required this.clientController});

  @override
  Future<FavDataModel> getFavDataApi(String token, String lang) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}/favorites');

    final response = await clientController.client.get(uri, headers: {
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
        debugPrint('get fav data success');
        final resposeData = FavDataModel.fromJson(data);
        return resposeData;
      } else {
        debugPrint('get fav data field');
        throw ServerException();
      }
    } else {
      debugPrint('3');
      throw ServerException();
    }
  }

  @override
  Future<String> addOrDeleteFavApi(String token, String lang, int id) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}/favorites');

    final response = await clientController.client
        .post(uri, body: json.encode({'product_id': id}), headers: {
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
        debugPrint('addOrDeleteFav data success');
        return data['message'];
      } else {
        debugPrint('addOrDeleteFav data field');
        throw ServerException();
      }
    } else {
      debugPrint('3');
      throw ServerException();
    }
  }
}
