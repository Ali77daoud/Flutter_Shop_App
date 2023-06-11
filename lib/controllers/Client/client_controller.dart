import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HttpClientController extends GetxController {
  late http.Client _client;

  http.Client get client => _client;

  @override
  void onInit() {
    super.onInit();
    _client = http.Client();
    debugPrint('init Client');
  }

  @override
  void onClose() {
    closeClient();
    super.onClose();
  }

  Future<void> closeClient() async {
    _client.close();
    debugPrint('closeClient');
  }

  Future<void> reOpenClient() async {
    _client = http.Client();
    debugPrint('reopenClient');
  }
}
