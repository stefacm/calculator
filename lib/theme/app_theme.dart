import 'package:flutter/material.dart';

/// Colores y estilos centrales para la app.
class AppColors {
  static const Color scaffoldBackground = Color(0xFF121212);
  static const Color displayBg = Color(0xFF1E1E1E);
  static const Color topRowBg = Color(0xFF2C2C2C);
  static const Color numberBg = Color(0xFF1E1E1E);
  static const Color operatorBg = Colors.orangeAccent;
  static const Color actionText = Colors.orangeAccent;
}

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle expression = TextStyle(
    fontSize: 24,
    color: Colors.grey,
  );

  static const TextStyle result = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle button = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      primaryColor: AppColors.operatorBg,
      cardColor: AppColors.displayBg,
      colorScheme: ColorScheme.dark(
        primary: AppColors.operatorBg,
        surface: AppColors.scaffoldBackground,
      ),
      textTheme: const TextTheme(
        titleLarge: AppTextStyles.title,
        bodyMedium: AppTextStyles.expression,
        headlineLarge: AppTextStyles.result,
        labelLarge: AppTextStyles.button,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          elevation: 2,
        ),
      ),
    );
  }
}
