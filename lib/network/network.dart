import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

mixin HTTPRequests {
  final _dio = Dio(BaseOptions(
    baseUrl: "https://api.openweathermap.org/data/2.5/",
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
    },
  ));

  Future<Map<String, dynamic>?> getRequest(String url) async {
    try {
      final res = await _dio.get(url);
      if (res.statusCode! >= 200 && res.statusCode! <= 208) {
        return res.data;
      } else {
        debugPrint("Request failed with status code: ${res.statusCode}");
        return null;
      }
    } catch (e) {
      debugPrint("Error during GET request: $e");
      return null;
    }
  }
}
