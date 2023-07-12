import 'package:flutter/material.dart';
import '../model/weather_model.dart';

Widget currentWind(Icon windIcon, String windDegree, String windGust, String windSpeed, String location) {
  Weather? weather; // Variable to hold the Weather object
  weather?.thisCityName = location; // Assign the location to the cityName property of the Weather object (doesn't have any effect)

  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        windIcon, // Icon widget representing the wind icon
        Text(
          "$windSpeed m/s", // Text widget displaying the wind speed
          style: const TextStyle(
            fontSize: 46.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          location, // Text widget displaying the location
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey[600],
          ),
        ),
      ],
    ),
  );
}
