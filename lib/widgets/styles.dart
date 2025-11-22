import 'package:flutter/material.dart';

class CalcStyles {
  // Colores
  static const Color background = Color(0xFF121212);
  static const Color displayBg = Color(0xFF1E1E1E);
  static const Color topRowBg = Color(0xFF2C2C2C);
  static const Color numberBg = Color(0xFF1E1E1E);
  static const Color operatorBg = Colors.orangeAccent;
  static const Color actionText = Colors.orangeAccent;

  // TextStyles
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
