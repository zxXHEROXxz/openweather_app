import 'package:flutter/material.dart';

TextStyle titleFont = const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);
TextStyle infoFont = const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0);

Widget additionalInformation(String wind, String humidity, String pressure, String feelsLike) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wind',
                  style: titleFont, // Style for the title "Wind"
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  'Pressure',
                  style: titleFont, // Style for the title "Pressure"
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$wind m/s',
                  style: infoFont, // Style for the wind information
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  '$pressure hPa',
                  style: infoFont, // Style for the pressure information
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Humidity',
                  style: titleFont, // Style for the title "Humidity"
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  'Feels Like',
                  style: titleFont, // Style for the title "Feels Like"
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$humidity %',
                  style: infoFont, // Style for the humidity information
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  '$feelsLike °C',
                  style: infoFont, // Style for the "feels like" temperature information
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
