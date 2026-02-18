import 'package:flutter/material.dart';

import '../features/auth/presentation/screen/splash_screen.dart';

class Routes{
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    Widget widget= SizedBox();
    switch(settings.name){
      case SplashScreen.name:
        widget = SplashScreen();
      case 'abcd':
        widget = SizedBox();
    }
    return MaterialPageRoute(builder: (context)=>  widget);
  }
}