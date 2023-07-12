import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import '../widgets/additional_pressure_info.dart';
import '../widgets/current_pressure.dart';

class PressurePage extends StatelessWidget {
  final String? location; // The location for which the pressure details are displayed
  final int? pressure; // The atmospheric pressure
  final int? seaLevelPressure; // The atmospheric pressure at sea level
  final int? groundLevelPressure; // The atmospheric pressure at ground level

  const PressurePage({
    super.key,
    this.location,
    this.pressure,
    this.seaLevelPressure,
    this.groundLevelPressure,
  });

  final Icon pressureIcon = const Icon(
    WeatherIcons.barometer, // Icon representing the pressure details (barometer icon)
    color: Colors.blue, // Color of the icon
    size: 64.0, // Size of the icon
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pressure Details"), // Title displayed in the app bar
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
            currentPressure(pressureIcon, '$pressure', '$location'), // Widget displaying current pressure details
            const Divider(), // Divider widget for visual separation
            SizedBox(
              height: 20.0,
            ),
            const Text(
              "Additional Pressure Details",
              style: TextStyle(
                fontSize: 24,
                color: Color(0xdd212121),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            SizedBox(
              height: 20.0,
            ),
            additionalPressureInfo('$seaLevelPressure', '$groundLevelPressure'), // Widget displaying additional pressure details
          ],
        ),
      ),
    );
  }
}
