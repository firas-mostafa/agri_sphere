import 'package:flutter/material.dart';
import 'package:mobile_app/presentation/auth/screens/register_page.dart';
import 'package:mobile_app/presentation/auth/screens/login_page.dart';
import 'package:mobile_app/presentation/language/screens/language_page.dart';
import 'package:mobile_app/presentation/main/screens/main_screen.dart';
import 'package:mobile_app/presentation/pest_scanner/screens/pest_scanner.dart';
import 'package:mobile_app/presentation/splash/splash_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    final routeName = routeSettings.name ?? '/';

    // Fast path for exact matches first
    switch (routeName) {
      case '/main':
        return MaterialPageRoute(builder: (_) => MainScreen());
      case '/pest_reporting':
        return MaterialPageRoute(builder: (_) => PestScanner());
      case '/language':
        return MaterialPageRoute(builder: (_) => LanguagePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterPage());
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
