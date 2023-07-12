import 'package:flutter/material.dart';
import '../widgets/additional_wind_info.dart';
import '../widgets/current_wind.dart';

class WindPage extends StatelessWidget {
  final String? location; // The location for which the wind details are displayed
  final double? windSpeed; // The wind speed in meters per second
  final int? windDeg; // The wind direction in degrees
  final double? windGust; // The gust speed of the wind

  const WindPage({
    super.key,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.location,
  });

  final Icon windIcon = const Icon(
    Icons.air, // Icon representing the wind details (air icon)
    color: Colors.blue, // Color of the icon
    size: 64.0, // Size of the icon
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Wind Details"), // Title displayed in the app bar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.green.shade100], // Gradient colors for the background
            begin: Alignment.centerLeft,
            end: Alignment.bottomCenter,
            stops: const [0.3, 0.7], // Stops for the gradient
          ),
        ),
        child: Column(
          children: [
            Container(
              child: currentWind(
                windIcon,
                '$windDeg',
                '$windGust',
                '$windSpeed',
                '$location',
              ), // Widget displaying current wind details
            ),
            const Divider(), // Divider widget for visual separation
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "Additional Wind Details",
              style: TextStyle(
                fontSize: 24,
                color: Color(0xdd212121),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 20.0,
            ),
            additionalWindInformation('$windDeg', '$windGust'), // Widget displaying additional wind details
          ],
        ),
      ),
    );
  }
}
