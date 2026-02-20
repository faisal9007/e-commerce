
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  final String _themeKey = 'theme';
  ThemeMode _mode = ThemeMode.system;
  ThemeMode get themeMode => _mode;



  List<ThemeMode> get themeModes => [
    .system,
    .dark,
    .light
  ];

  void changeThemeMode(ThemeMode newThemeMode) {
    _mode = newThemeMode;
    notifyListeners();
    _saveThemeMode();
  }
  Future<void> _saveThemeMode  () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString(_themeKey, _mode.name);
}
Future<void> loadThemeData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedLocale = prefs.getString(_themeKey);
  if (savedLocale != null) {
    _mode = ThemeMode.values.firstWhere((mode) => mode.name == savedLocale);

};
  }
}
