import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/app/routes.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/screen/splash_screen.dart';
import 'app_theme.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CraftyBay E-Commerce',
      initialRoute: SplashScreen.name,
      onGenerateRoute: Routes.onGenerateRoute,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
    );
  }
}
