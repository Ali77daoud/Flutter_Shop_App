import 'dart:convert';
import 'package:agora_shop/controllers/Client/client_controller.dart';
import 'package:agora_shop/models/Address/addresses_data_model.dart';
import 'package:agora_shop/services/networking/api_constants.dart';
import 'package:flutter/material.dart';
import '../../models/Address/add_address_model.dart';
import '../../shared/errors/exceptions.dart';

abstract class CheckOutApiService {
  Future<AddressesDataModel> getAddressDataApi(String token, String lang);
  Future<AddAddressModel> addAddressApi(
      AddAddress addAddress, String token, String lang);
  Future<String> deleteAddressApi(int id, String token, String lang);
  Future<String> addOrderApi(String token, String lang, int addressId);
}

class CheckOutApiServiceImpWithHttp implements CheckOutApiService {
  final HttpClientController clientController;

  CheckOutApiServiceImpWithHttp({required this.clientController});

  @override
  Future<AddressesDataModel> getAddressDataApi(
      String token, String lang) async {
    clientController.reOpenClient();
    final uri = Uri.parse('${ApiConstants.baseUrl}/addresses');
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
        debugPrint('get address data success');
        final resposeData = AddressesDataModel.fromJson(data);
        return resposeData;
      } else {
        debugPrint('get address data field');
        throw ServerException();
      }
    } else {
      debugPrint('3');
      throw ServerException();
    }
  }

  @override
  Future<AddAddressModel> addAddressApi(
      AddAddress addAddress, String token, String lang) async {
    clientController.reOpenClient();
    final uri = Uri.parse('${ApiConstants.baseUrl}/addresses');
    final body = addAddress.toJson();
    final response = await clientController.client
        .post(uri, body: json.encode(body), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Connection': 'keep-alive',
      'Authorization': token,
      'lang': lang,
    });
    debugPrint('1');
    debugPrint(response.statusCode.toString());
    if (response.statusCode >= 200 && response.statusCode < 300) {
      debugPrint('2');
      final data = jsonDecode(response.body);
      if (data['status'] == true) {
        debugPrint('addAddress data success');
        return AddAddressModel.fromJson(data);
      } else {
        debugPrint('addAddress data field');
        throw ServerException();
      }
    } else {
      debugPrint('3');
      throw ServerException();
    }
  }

  @override
  Future<String> deleteAddressApi(int id, String token, String lang) async {
    clientController.reOpenClient();
    final uri = Uri.parse('${ApiConstants.baseUrl}/addresses/$id');
    final response = await clientController.client.delete(
      uri,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Connection': 'keep-alive',
        'Authorization': token,
        'lang': lang,
      },
    );
    debugPrint('1');
    debugPrint(response.statusCode.toString());
    if (response.statusCode >= 200 && response.statusCode < 300) {
      debugPrint('2');
      final data = jsonDecode(response.body);
      if (data['status'] == true) {
        debugPrint('deleteAddress success');
        return data['message'];
      } else {
        debugPrint('deleteAddress field');
        throw ServerException();
      }
    } else {
      debugPrint('3');
      throw ServerException();
    }
  }

  @override
  Future<String> addOrderApi(String token, String lang, int addressId) async {
    clientController.reOpenClient();
    final uri = Uri.parse('${ApiConstants.baseUrl}/orders');
    final response = await clientController.client.post(uri,
        body: json.encode({
          'address_id': addressId,
          'payment_method': 1,
          'use_points': false
        }),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Connection': 'keep-alive',
          'Authorization': token,
          'lang': lang,
        });
    debugPrint('1');
    debugPrint(response.statusCode.toString());
    if (response.statusCode >= 200 && response.statusCode < 300) {
      debugPrint('2');
      final data = jsonDecode(response.body);
      if (data['status'] == true) {
        debugPrint('addOrder success');
        return data['message'];
      } else {
        debugPrint('addOrder field');
        throw ServerException();
      }
    } else {
      debugPrint('3');
      throw ServerException();
    }
  }
}
