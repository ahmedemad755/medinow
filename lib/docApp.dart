import 'package:flutter/material.dart';
import 'package:medinow/core/routing/app_rout.dart';
import 'package:medinow/core/routing/routes.dart';
import 'package:medinow/core/theme/colors/colors.dart';
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
          initialRoute: Routes.homeScreen,
          onGenerateRoute: appRoutes.generateRoute,
        );
      },
    );
  }
}
