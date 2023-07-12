import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/weather_model.dart';
import 'openweather_Key.dart';

String openWeatherKey = WeatherApiKey.openWeatherKey;
String url = 'https://api.openweathermap.org/data/2.5/weather';

// A class responsible for making API calls to retrieve weather data
class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse('$url?q=$location&appid=$openWeatherKey&units=metric');

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    
    // If the response indicates that the city was not found
    if (response.statusCode == 404) {
      // Return a Weather object with default values for error handling
      return Weather(
        thisCityName: "City not found",
        thisTemp: 0.0,
        thisWeatherLike: 'Weather not found',
        thisWeatherDesc: 'Weather not found',
        thisWeatherIcon: '01d',
        thisWindSpeed: 0.0,
        thisWindDegrees: 0,
        thisWindGust: 0.0,
        thisHumidity: 0,
        thisFeelsLike: 0.0,
        thisPressure: 0,
        thisSeaLevelPressure: 0,
        thisGroundLevelPressure: 0,
      );
    } else {
      // Print the cityName for debugging purposes
      debugPrint(Weather.fromJson(body).thisCityName);
      // Return a Weather object created from the API response
      return Weather.fromJson(body);
    }
  }
}
