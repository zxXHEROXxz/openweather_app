import 'package:flutter/material.dart';

TextStyle titleFont = const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);
TextStyle infoFont = const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0);

Widget additionalPressureInfo(String seaLevelPressure, String groundLevelPressure) {
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
                  'Sea Level',
                  style: titleFont, // Style for the title "Sea Level"
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  'Ground Level',
                  style: titleFont, // Style for the title "Ground Level"
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$seaLevelPressure hPa',
                  style: infoFont, // Style for the sea level pressure information
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  '$groundLevelPressure hPa',
                  style: infoFont, // Style for the ground level pressure information
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
