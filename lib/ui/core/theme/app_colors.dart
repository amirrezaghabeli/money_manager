import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primaryColor = _primaryColorLight;
  static const Color backgroundColor = _backgroundColorLight;
  static const Color onSurfaceColor = _onSurfaceColorLight;

  //Light theme colors
  static const Color _primaryColorLight = Color(0xFF4FC3F7);
  static const Color _backgroundColorLight = Color(0xFFFFFFFF);
  static const Color _onSurfaceColorLight = Color(0xFF222939);

  //Dark theme colors
  static const Color _primaryColorDark = Color(0xFF4FC3F7);
  static const Color _backgroundColorDark = Color(0xFF1A237E);
  static const Color _onSurfaceColorDark = Color(0xFFFFFFFF);
}
