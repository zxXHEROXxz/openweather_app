import 'package:flutter/material.dart';

TextStyle titleFont = const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);
TextStyle infoFont = const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0);

Widget additionalWindInformation(String windDeg, String windGust) {
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
                  'Wind Degree',
                  style: titleFont, // Style for the title "Wind Degree"
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  'Wind Gust',
                  style: titleFont, // Style for the title "Wind Gust"
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$windDeg°',
                  style: infoFont, // Style for the wind degree information
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  '$windGust m/s',
                  style: infoFont, // Style for the wind gust information
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
