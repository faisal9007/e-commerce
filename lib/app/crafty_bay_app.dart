import 'package:e_commerce/app/provider/localization_provider.dart';
import 'package:e_commerce/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../features/auth/presentation/screen/splash_screen.dart';
import '../l10n/app_localizations.dart';
import 'app_theme.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocalizationProvider()),
      ],
      child: Consumer<LocalizationProvider>(
        builder: (context, localizationProvider, _) {
          return MaterialApp(
            title: 'CraftyBay E-Commerce',
            initialRoute: SplashScreen.name,
            onGenerateRoute: Routes.onGenerateRoute,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
              supportedLocales: localizationProvider.supportedLocales,
            locale: localizationProvider.locale,

          );
        }
      ),
    );
  }
}
