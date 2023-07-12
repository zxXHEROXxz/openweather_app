import 'package:flutter/material.dart';
import '../model/weather_model.dart';

Widget currentPressure(Icon pressureIcon, String pressure, String location) {
  Weather? weather; // Variable to hold the Weather object
  weather?.thisCityName = location; // Assign the location to the cityName property of the Weather object (doesn't have any effect)

  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        pressureIcon, // Icon widget representing the pressure icon
        const SizedBox(
          height: 20.0,
        ),
        Text(
          "$pressure hPa", // Text widget displaying the pressure in hPa
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
