import 'dart:convert';
import 'package:agora_shop/controllers/Client/client_controller.dart';
import 'package:agora_shop/models/HomeData/category_data_model.dart';
import 'package:agora_shop/models/CategoryProduct/category_product_model.dart';
import 'package:agora_shop/models/HomeData/home_data_model.dart';
import 'package:agora_shop/models/ProductDetails/product_details_model.dart';
import 'package:agora_shop/models/HomeData/search_product_data_model.dart';
import 'package:agora_shop/shared/errors/exceptions.dart';
import 'package:flutter/material.dart';
import 'api_constants.dart';

abstract class HomeApiService {
  Future<HomeDataModel> getHomeDataApi(String token, String lang);
  Future<CategoryDataModel> getCategoryDataApi(String token, String lang);
  Future<ProductDetailsModel> getProductDetailsApi(
      String token, String lang, int id);
  Future<SearchProductDataModel> searchProductApi(
      String token, String lang, String text);
  Future<CategoryProductModel> getCategoryProductDataApi(
      String token, String lang, int categoryId);
}

class HomeApiServiceImpWithHttp implements HomeApiService {
  final HttpClientController clientController;

  HomeApiServiceImpWithHttp({required this.clientController});
  @override
  Future<HomeDataModel> getHomeDataApi(String token, String lang) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}/home');

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
        debugPrint('get home data success');
        final resposeData = HomeDataModel.fromJson(data);
        return resposeData;
      } else {
        debugPrint('get home data field');
        throw ServerException();
      }
    } else {
      debugPrint('3');
      throw ServerException();
    }
  }

  @override
  Future<CategoryDataModel> getCategoryDataApi(
      String token, String lang) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}/categories');

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
        debugPrint('get category data success');
        final resposeData = CategoryDataModel.fromJson(data);
        return resposeData;
      } else {
        debugPrint('get category data field');
        throw ServerException();
      }
    } else {
      debugPrint('3');
      throw ServerException();
    }
  }

  @override
  Future<ProductDetailsModel> getProductDetailsApi(
      String token, String lang, int id) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}/products/$id');

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
        debugPrint('get product details success');
        final resposeData = ProductDetailsModel.fromJson(data);
        return resposeData;
      } else {
        debugPrint('get product details field');
        throw ServerException();
      }
    } else {
      debugPrint('3');
      throw ServerException();
    }
  }

  @override
  Future<SearchProductDataModel> searchProductApi(
      String token, String lang, String text) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}/products/search');

    final response = await clientController.client
        .post(uri, body: json.encode({'text': text}), headers: {
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
        debugPrint('search success');
        final resposeData = SearchProductDataModel.fromJson(data);
        return resposeData;
      } else {
        debugPrint('search field');
        throw ServerException();
      }
    } else {
      debugPrint('3');
      throw ServerException();
    }
  }

  @override
  Future<CategoryProductModel> getCategoryProductDataApi(
      String token, String lang, int categoryId) async {
    final uri =
        Uri.parse('${ApiConstants.baseUrl}/products?category_id=$categoryId');

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
        debugPrint('Product Category success');
        final resposeData = CategoryProductModel.fromJson(data);
        return resposeData;
      } else {
        debugPrint('Product Category field');
        throw ServerException();
      }
    } else {
      debugPrint('3');
      throw ServerException();
    }
  }
}
