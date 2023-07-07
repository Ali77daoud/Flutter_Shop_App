import 'dart:convert';

import 'package:agora_shop/controllers/Client/client_controller.dart';
import 'package:agora_shop/models/Orders/get_order_model.dart';
import 'package:agora_shop/services/networking/api_constants.dart';
import 'package:agora_shop/shared/errors/exceptions.dart';
import 'package:flutter/material.dart';

abstract class OrdersApiService {
  Future<OrderModel> getOrdersDataApi(String token, String lang);
}

class OrdersApiServiceImpWithHttp implements OrdersApiService {
  final HttpClientController clientController;

  OrdersApiServiceImpWithHttp({required this.clientController});

  @override
  Future<OrderModel> getOrdersDataApi(String token, String lang) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}/orders');
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
        debugPrint('get Orders data success');
        final resposeData = OrderModel.fromJson(data);
        return resposeData;
      } else {
        debugPrint('get Orders data field');
        throw ServerException();
      }
    } else {
      debugPrint('3');
      throw ServerException();
    }
  }
}
