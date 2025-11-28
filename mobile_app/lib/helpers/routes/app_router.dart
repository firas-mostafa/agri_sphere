import 'package:flutter/material.dart'
    show RouteSettings, Route, MaterialPageRoute;
import 'package:mobile_app/main.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    final routeName = routeSettings.name ?? '/';

    // Fast path for exact matches first
    switch (routeName) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage(title: ''));
      default:
        return MaterialPageRoute(builder: (_) => MyHomePage(title: ''));
    }
  }
}
