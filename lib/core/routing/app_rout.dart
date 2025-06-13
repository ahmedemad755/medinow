import 'package:flutter/material.dart';
import 'package:medinow/features/home/logic/home_cubit.dart';
import 'package:medinow/features/home/ui/home_screen.dart';
import '../di/dibendancy_ingection.dart';
import 'routes.dart';

import '../../features/logic/login/login_cubit.dart';
import '../../features/logic/signUp/sign_up_cubit.dart';
import '../../features/login/ui/LoginPage.dart' show LoginPage;
import '../../features/sign_up/ui/sign_upscrean.dart';
import '../../features/ui/OnboardingScrean/OnboardingScrean.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  Route? generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.OnboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScrean());
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => HomeCubit(getIt())..getSpecializations(),
                child: const HomeScreen(),
              ),
        );
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
        return null;
    }
  }
}

// Replace HomePage, LoginPage, and DashboardPage with your actual widget classes.
