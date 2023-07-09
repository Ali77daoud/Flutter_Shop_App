import 'dart:convert';
import 'package:agora_shop/controllers/Client/client_controller.dart';
import 'package:agora_shop/models/Cart/cart_data_model.dart';
import 'package:agora_shop/services/networking/api_constants.dart';
import 'package:agora_shop/shared/errors/exceptions.dart';
import 'package:flutter/material.dart';

abstract class CartApiService {
  Future<CartDataModel> getCartDataApi(String token, String lang);
  Future<String> addOrRemoveCartApi(String token, String lang, int id);
  Future<String> updateCartApi(String token, String lang, int id, int quantity);
  Future<String> deleteCartApi(String token, String lang, int id);
}

class CartApiServiceImpWithHttp implements CartApiService {
  final HttpClientController clientController;

  CartApiServiceImpWithHttp({required this.clientController});

  @override
  Future<CartDataModel> getCartDataApi(String token, String lang) async {
    clientController.closeClient();
    clientController.reOpenClient();
    final uri = Uri.parse('${ApiConstants.baseUrl}/carts');
    final response = await clientController.client.get(uri, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token,
      'Connection': 'keep-alive',
      'lang': lang,
    });
    debugPrint('1');
    debugPrint(response.statusCode.toString());
    if (response.statusCode >= 200 && response.statusCode < 300) {
      debugPrint('2');
      final data = jsonDecode(response.body);
      if (data['status'] == true) {
        debugPrint('get cart data success');
        final resposeData = CartDataModel.fromJson(data);
        return resposeData;
      } else {
        debugPrint('get cart data field');
        throw ServerException();
      }
    } else {
      debugPrint('3');
      throw ServerException();
    }
  }

  @override
  Future<String> addOrRemoveCartApi(String token, String lang, int id) async {
    clientController.reOpenClient();
    final uri = Uri.parse('${ApiConstants.baseUrl}/carts');
    final response = await clientController.client
        .post(uri, body: json.encode({'product_id': id}), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token,
      'Connection': 'keep-alive',
      'lang': lang,
    });
    debugPrint('1');
    debugPrint(response.statusCode.toString());
    if (response.statusCode >= 200 && response.statusCode < 300) {
      debugPrint('2');
      final data = jsonDecode(response.body);
      if (data['status'] == true) {
        debugPrint('addOrRemoveCart data success');
        return data['message'];
      } else {
        debugPrint('addOrRemoveCart data field');
        throw ServerException();
      }
    } else {
      debugPrint('3');
      throw ServerException();
    }
  }

  @override
  Future<String> updateCartApi(
      String token, String lang, int id, int quantity) async {
    clientController.reOpenClient();
    final uri = Uri.parse('${ApiConstants.baseUrl}/carts/$id');
    final response = await clientController.client
        .put(uri, body: json.encode({'quantity': quantity}), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token,
      'Connection': 'keep-alive',
      'lang': lang,
    });
    debugPrint('1');
    debugPrint(response.statusCode.toString());
    if (response.statusCode >= 200 && response.statusCode < 300) {
      debugPrint('2');
      final data = jsonDecode(response.body);
      if (data['status'] == true) {
        debugPrint('update cart data success');
        return data['message'];
      } else {
        debugPrint('update cart data field');
        throw ServerException();
      }
    } else {
      debugPrint('3');
      throw ServerException();
    }
  }

  @override
  Future<String> deleteCartApi(String token, String lang, int id) async {
    clientController.reOpenClient();
    final uri = Uri.parse('${ApiConstants.baseUrl}/carts/$id');
    final response = await clientController.client.delete(uri, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token,
      'Connection': 'keep-alive',
      'lang': lang,
    });
    debugPrint('1');
    debugPrint(response.statusCode.toString());
    if (response.statusCode >= 200 && response.statusCode < 300) {
      debugPrint('2');
      final data = jsonDecode(response.body);
      if (data['status'] == true) {
        debugPrint('update cart data success');
        return data['message'];
      } else {
        debugPrint('update cart data field');
        throw ServerException();
      }
    } else {
      debugPrint('3');
      throw ServerException();
    }
  }
}
