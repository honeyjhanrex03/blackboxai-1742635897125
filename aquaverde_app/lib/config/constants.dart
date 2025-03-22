import 'package:flutter/material.dart';

class AppConstants {
  // App Info
  static const String appName = 'AquaVerde';
  static const String appVersion = '1.0.0';
  
  // Assets
  static const String logoPath = 'assets/images/logo.png';
  static const String facebookIconPath = 'assets/images/facebook.png';
  static const String googleIconPath = 'assets/images/google.png';
  
  // API Endpoints (for future implementation)
  static const String baseUrl = 'https://api.aquaverde.com';
  static const String loginEndpoint = '/auth/login';
  static const String signupEndpoint = '/auth/signup';
  static const String devicesEndpoint = '/devices';
  
  // Animations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 350);
  static const Duration longAnimation = Duration(milliseconds: 500);
  
  // Dimensions
  static const double defaultPadding = 24.0;
  static const double defaultBorderRadius = 16.0;
  static const double buttonHeight = 56.0;
  static const double iconSize = 24.0;
  
  // Colors
  static const Color primaryBlue = Color(0xFF6C63FF);
  static const Color primaryGreen = Color(0xFF00C853);
  static const Color textPrimary = Color(0xFF1F1F1F);
  static const Color textSecondary = Color(0xFF757575);
  static const Color background = Colors.white;
  static const Color error = Color(0xFFE53935);
  static const Color success = Color(0xFF43A047);
  
  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF6C63FF),
      Color(0xFF5C52FF),
    ],
  );
  
  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF00C853),
      Color(0xFF00B548),
    ],
  );

  // Text Styles
  static const TextStyle headingLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: textPrimary,
    height: 1.2,
  );

  static const TextStyle headingMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textPrimary,
    height: 1.2,
  );

  static const TextStyle headingSmall = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: textPrimary,
    height: 1.2,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: textPrimary,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: textPrimary,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: textSecondary,
    height: 1.5,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    height: 1.5,
  );

  // Validation Patterns
  static final RegExp emailPattern = RegExp(
    r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
  );
  
  static final RegExp passwordPattern = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  // Error Messages
  static const String emailRequired = 'Email is required';
  static const String invalidEmail = 'Please enter a valid email';
  static const String passwordRequired = 'Password is required';
  static const String invalidPassword = 'Password must be at least 8 characters with letters and numbers';
  static const String nameRequired = 'Name is required';
  static const String termsRequired = 'Please accept the terms and conditions';

  // Success Messages
  static const String loginSuccess = 'Login successful';
  static const String signupSuccess = 'Account created successfully';
  static const String deviceConnected = 'Device connected successfully';
  static const String scheduleUpdated = 'Feeding schedule updated';
}