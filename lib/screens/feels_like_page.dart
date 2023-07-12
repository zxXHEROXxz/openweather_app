import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import '../widgets/current_feels_like.dart';

class FeelsLikePage extends StatelessWidget {
  final String? location; // The location for which the "feels like" details are displayed
  final double? feelsLike; // The "feels like" temperature

  const FeelsLikePage({super.key, this.location, this.feelsLike});

  final Icon feelsLikeIcon = const Icon(
    WeatherIcons.thermometer, // Icon representing the "feels like" details (barometer icon)
    color: Colors.blue, // Color of the icon
    size: 64.0, // Size of the icon
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Feels Like Details"), // Title displayed in the app bar
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
            currentFeelsLike(feelsLikeIcon, '$feelsLike', '$location'), // Widget displaying current "feels like" details
            const Divider(), // Divider widget for visual separation
          ],
        ),
      ),
    );
  }
}
