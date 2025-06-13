import 'package:flutter/material.dart';
import 'package:medinow/core/helper/constans.dart';
import 'core/routing/app_rout.dart';
import 'core/routing/routes.dart';
import 'core/theme/colors/colors.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Docapp extends StatelessWidget {
  final AppRoutes appRoutes;
  const Docapp({super.key, required this.appRoutes});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'DocApp',
          theme: ThemeData(
            primaryColor: ColorsManager.mainBlue,
            // fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          initialRoute:
              isLoggedInUser ? Routes.homeScreen : Routes.OnboardingScreen,
          onGenerateRoute: appRoutes.generateRoute,
        );
      },
    );
  }
}
