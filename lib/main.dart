import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    User user = User(xp: 0, level: 1, title: "Beginner");

    return MaterialApp(
      title: 'Solo Leveling Fitness',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF1C1C1C), // Dark theme primary color
        scaffoldBackgroundColor: Color(0xFF0D0D0D), // Dark background color
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.lightBlueAccent, // Light blue for headers
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          titleMedium: TextStyle(
            color: Colors.white, // White text for general use
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xFF00FFFF), // Neon cyan for secondary elements
        ),
      ),
      home: MainScreen(user: user),
    );
  }
}
