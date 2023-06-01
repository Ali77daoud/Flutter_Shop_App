import 'dart:convert';
import 'package:agora_shop/models/Auth/login_model.dart';
import 'package:agora_shop/models/Auth/user_data_model.dart';
import 'package:agora_shop/services/networking/api_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../models/Auth/register_model.dart';
import '../../shared/errors/exceptions.dart';

abstract class AuthApiService {
  Future<UserDataModel> postLoginApi(LoginModel loginModel);
  Future<UserDataModel> postRegisterApi(RegisterModel registerModel);
}

class AuthApiServiceImpWithHttp implements AuthApiService {
  final http.Client client;

  AuthApiServiceImpWithHttp({required this.client});

  @override
  Future<UserDataModel> postLoginApi(LoginModel loginModel) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}/login');
    final body = loginModel.toJson();
    final response = await client.post(uri, body: json.encode(body), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });
    debugPrint('1');
    debugPrint(response.statusCode.toString());
    if (response.statusCode >= 200 && response.statusCode < 300) {
      debugPrint('2');
      final data = jsonDecode(response.body);
      if (data['status'] == true) {
        debugPrint('logIn success');
        final resposeData = UserDataModel.fromJson(data['data']);
        return resposeData;
      } else {
        debugPrint('logIn field');
        throw WrongDataException();
      }
    } else {
      debugPrint('3');
      throw ServerException();
    }
  }

  ///////////////////////////////////////////////////////////////////////
  @override
  Future<UserDataModel> postRegisterApi(RegisterModel registerModel) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}/register');
    final body = registerModel.toJson();
    final response = await client.post(uri, body: json.encode(body), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });
    debugPrint('1');
    debugPrint(response.statusCode.toString());
    if (response.statusCode >= 200 && response.statusCode < 300) {
      debugPrint('2');
      final data = jsonDecode(response.body);
      if (data['status'] == true) {
        debugPrint('Register success');
        final resposeData = UserDataModel.fromJson(data['data']);
        return resposeData;
      } else {
        debugPrint('Register field');
        throw WrongDataException();
      }
    } else {
      debugPrint('3');
      throw ServerException();
    }
  }
}
