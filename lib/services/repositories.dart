import 'package:flutter/material.dart';

import '../constants.dart';
import '../http_exception.dart';
import '../models/weather_mode.dart';
import 'package:http/http.dart' as http;

class Repositories {
  static Future<WeatherModel?> getWeather(int lat, int long) async {
    final url = Uri.parse('${Constants.baseUrl}data/2.5/weather?lat=$lat&lon=$long&appid=${Constants.apiKey}');
    debugPrint('url $url');
    try {
      final response = await http.get(url);
      debugPrint('response $response');
      debugPrint('body ${response.body}');
      if (response.statusCode >= 400) {
        throw HttpException('Could not get weather.');
      }
      WeatherModel? weatherModel = weatherModelFromJson(response.body);
      return weatherModel;
    } catch (e) {
      rethrow;
    }
  }
}
