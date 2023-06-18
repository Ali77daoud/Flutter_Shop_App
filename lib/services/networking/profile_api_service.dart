import 'dart:convert';
import 'package:agora_shop/controllers/Client/client_controller.dart';
import 'package:agora_shop/models/Auth/update_profile_model.dart';
import 'package:agora_shop/models/Auth/user_data_model.dart';
import 'package:agora_shop/services/networking/api_constants.dart';
import 'package:flutter/cupertino.dart';
import '../../shared/errors/exceptions.dart';

abstract class ProfileApiService {
  Future<UserModel> updateProfileApi(
      UpdateProfileModel updateProfileModel, String token, String lang);

  Future<UserDataModel> getUserDataApi(String token, String lang);
}

class ProfileApiServiceImpWithHttp implements ProfileApiService {
  final HttpClientController clientController;

  ProfileApiServiceImpWithHttp({required this.clientController});

  @override
  Future<UserModel> updateProfileApi(
      UpdateProfileModel updateProfileModel, String token, String lang) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}/update-profile');
    final body = updateProfileModel.toJson();
    final response = await clientController.client
        .put(uri, body: json.encode(body), headers: {
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
        debugPrint('Update Profile success');
        final resposeData = UserModel.fromJson(data);
        return resposeData;
      } else {
        debugPrint('Update Profile field');
        throw WrongDataException();
      }
    } else {
      debugPrint('3');
      throw ServerException();
    }
  }

  @override
  Future<UserDataModel> getUserDataApi(String token, String lang) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}/profile');
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
        debugPrint('getUserData success');
        final resposeData = UserDataModel.fromJson(data['data']);
        return resposeData;
      } else {
        debugPrint('getUserData field');
        throw ServerException();
      }
    } else {
      debugPrint('3');
      throw ServerException();
    }
  }
}
