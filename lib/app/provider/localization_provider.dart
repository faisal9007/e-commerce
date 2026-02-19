import 'dart:ui';

import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier {
  Locale _locale = Locale('en');
  Locale get locale => _locale;

  List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  void chanheLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}