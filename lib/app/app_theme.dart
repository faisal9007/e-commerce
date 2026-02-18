import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData _lightThekemData = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    scaffoldBackgroundColor: Colors.white,
    progressIndicatorTheme: _progressIndicatorThemeData,
    );


  static ThemeData _darkThekemData = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey.shade900,
      progressIndicatorTheme: _progressIndicatorThemeData,
      );

  static ProgressIndicatorThemeData get _progressIndicatorThemeData {
    return ProgressIndicatorThemeData(
      color: AppColors.themeColor,
    );
  }
  static ThemeData get lightTheme => _lightThekemData;
  static ThemeData get darkTheme => _darkThekemData;
}


