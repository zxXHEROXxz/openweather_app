import 'package:flutter/material.dart';

import 'screens/homepage.dart';

void main() => runApp(const MyApp());

// The main entry point of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor for the MyApp class

  @override
  Widget build(BuildContext context) {
    // Build method for creating the application's UI
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'FiraSansCondensed', // Set the default font for the app
        useMaterial3: true, // Enable the Material 3 design system
      ),
      home: const HomePage(), // Set the initial screen of the app to HomePage
    );
  }
}
