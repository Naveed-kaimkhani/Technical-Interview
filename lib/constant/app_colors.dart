import 'package:flutter/material.dart';

class AppColors {
  static const LinearGradient appGradientColors = LinearGradient(
    end: Alignment.topLeft, // Matches the 157deg angle
    begin: Alignment.bottomRight,
    colors: [
      Color(0xFF02243F), // Dark Blue
      Color(0xFF072B48), // Medium Blue
      Color(0xFF1F4F74), // Lighter Blue
    ],
    stops: [0.0, 0.56, 0.91], // Matches the percentage stops
    transform: GradientRotation(
      157 * 3.1415927 / 180,
    ), // Convert degrees to radians
  );
  static const Color blue =   Color(0xFF02243F);// Dark Blue
    
  
  static const Color appColor = Color.fromARGB(255, 217, 221, 237);
  // static Color selectedColor = const Color(0xFFCFD4EA); // #CFD4EA
  // Updated to #CFD4EA
}
