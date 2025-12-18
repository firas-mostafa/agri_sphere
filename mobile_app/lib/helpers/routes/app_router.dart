import 'package:flutter/material.dart'
    show RouteSettings, Route, MaterialPageRoute;
import 'package:mobile_app/presentation/auth/screens/register_page.dart';
import 'package:mobile_app/presentation/auth/screens/login_page.dart';
import 'package:mobile_app/presentation/home/screens/home_page.dart';
import 'package:mobile_app/presentation/language/screens/language_page.dart';
import 'package:mobile_app/presentation/splash/splash_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    final routeName = routeSettings.name ?? '/';

    // Fast path for exact matches first
    switch (routeName) {
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
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
