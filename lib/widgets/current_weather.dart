import 'package:flutter/material.dart';
import '../model/weather_model.dart';

Widget currentWeather(String weatherIcon, String weatherDescription, String temp, String location, String countryName) {
  Weather? weather; // Variable to hold the Weather object
  weather?.thisCityName = location; // Assign the location to the cityName property of the Weather object (doesn't have any effect)

  String iconImageUrl = "https://openweathermap.org/img/wn/$weatherIcon@4x.png"; // URL for the weather icon image

  Image weatherIconImage = Image.network(
    iconImageUrl, // Display the weather icon using the network image

    width: 150.0,
    height: 150.0,
    fit: BoxFit.cover,
    filterQuality: FilterQuality.high,
  );

  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        weatherIconImage, // Display the weather icon image
        Text(
          weatherDescription, // Text widget displaying the weather description
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          "$temp °C", // Text widget displaying the temperature
          style: const TextStyle(
            fontSize: 46.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          '$location, $countryName', // Text widget displaying the location and country name
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey[700],
          ),
        ),
      ],
    ),
  );
}
