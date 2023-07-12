import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import '../widgets/current_humidity.dart';

class HumidityPage extends StatelessWidget {
  final String? location; // The location for which the humidity details are displayed
  final int? humidity; // The humidity percentage

  const HumidityPage({super.key, this.location, this.humidity});

  final Icon humidityIcon = const Icon(
    WeatherIcons.humidity, // Icon representing the humidity details (humidity icon)
    color: Colors.blue, // Color of the icon
    size: 64.0, // Size of the icon
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Humidity Details"), // Title displayed in the app bar
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
            currentHumidity(humidityIcon, '$humidity', '$location'), // Widget displaying current humidity details
            const Divider(), // Divider widget for visual separation
          ],
        ),
      ),
    );
  }
}
