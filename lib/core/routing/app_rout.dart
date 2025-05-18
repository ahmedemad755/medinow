import 'package:flutter/material.dart';
import 'package:medinow/core/di/dibendancy_ingection.dart';
import 'package:medinow/core/routing/routes.dart';
import 'package:medinow/features/logic/login/login_cubit.dart';
import 'package:medinow/features/logic/signUp/sign_up_cubit.dart';
import 'package:medinow/features/login/ui/LoginPage.dart' show LoginPage;
import 'package:medinow/features/sign_up/ui/sign_upscrean.dart';
import 'package:medinow/features/ui/OnboardingScrean/OnboardingScrean.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.OnboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScrean());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.login:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: LoginPage(),
              ),
        );
      case Routes.signUp:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<SignupCubit>(),
                child: SignUpscrean(),
              ),
        );

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
