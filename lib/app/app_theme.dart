import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData _lightThekemData = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    scaffoldBackgroundColor: Colors.white,
    progressIndicatorTheme: _progressIndicatorThemeData,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    filledButtonTheme: _filledButtonTheme,
    );


  static ThemeData _darkThekemData = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey.shade900,
      progressIndicatorTheme: _progressIndicatorThemeData,
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecorationTheme,
    filledButtonTheme: _filledButtonTheme,
      );
  static TextTheme get _textTheme => TextTheme(
    titleLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: Colors.grey.shade700,
    ),
  );

  static InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.grey),
    contentPadding: .symmetric(horizontal: 16, vertical: 0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.themeColor, width: 1),
    ),
    errorBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.red, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.themeColor, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.themeColor, width: 1),
    ),
  );

  static FilledButtonThemeData get _filledButtonTheme => FilledButtonThemeData(

        style: FilledButton.styleFrom(
            backgroundColor: AppColors.themeColor,
            fixedSize: Size.fromWidth(double.maxFinite),
            padding: .symmetric(vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
  );

  static ProgressIndicatorThemeData get _progressIndicatorThemeData {
    return ProgressIndicatorThemeData(
      color: AppColors.themeColor,
    );
  }
  static ThemeData get lightTheme => _lightThekemData;
  static ThemeData get darkTheme => _darkThekemData;
}


