import 'package:flutter/material.dart';

import '../features/shared/presentation/screen/main_nav_holder_screen.dart';
import '../features/auth/presentation/screen/sign_in_screen.dart';
import '../features/auth/presentation/screen/sign_up_screen.dart';
import '../features/auth/presentation/screen/splash_screen.dart';
import '../features/auth/presentation/screen/varify_otp_screen.dart';
import '../products/presentation/screen/products_list_screen.dart';

class Routes{
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    late Widget widget;
    switch(settings.name){
      case SplashScreen.name:
        widget = SplashScreen();
      case SignUpScreen.name:
        widget = SignUpScreen();
      case SignInScreen.name:
        widget = SignInScreen();
      case VarifyOtpScreen.name:
        widget = VarifyOtpScreen();
      case MainNavHolderScreen.name:
        widget = MainNavHolderScreen();
        case ProductsListScreen.name:
          final categoryName = settings.arguments as String;
        widget = ProductsListScreen(categoryName:categoryName,);
      default:
        widget = SplashScreen();
    }
    return MaterialPageRoute(builder: (context)=>  widget);
  }
}