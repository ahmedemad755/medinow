import 'package:flutter/material.dart';
import 'package:medinow/core/routing/routes.dart';
import 'package:medinow/features/ui/LoginPage.dart' show LoginPage;
import 'package:medinow/features/ui/OnboardingScrean/OnboardingScrean.dart';

class AppRoutes {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.OnboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScrean());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      // case dashboard:
      //   return MaterialPageRoute(builder: (_) => DashboardPage());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}

// Replace HomePage, LoginPage, and DashboardPage with your actual widget classes.
