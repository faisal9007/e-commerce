import 'dart:ui';

import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationProvider extends ChangeNotifier {
  final String _localeKey = 'locale';
  Locale _locale = Locale('en');
  Locale get locale => _locale;

  List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  void chanheLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
    _saveLocale();
  }
  Future<void> _saveLocale  () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString(_localeKey, _locale.languageCode);
}
Future<void> loadLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedLocale = prefs.getString(_localeKey);
  if (savedLocale != null) {
    _locale = Locale(savedLocale);
  }
}
}