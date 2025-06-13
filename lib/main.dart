import 'package:flutter/material.dart';
import 'core/di/dibendancy_ingection.dart';
import 'core/routing/app_rout.dart';
import 'docApp.dart' show Docapp;
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  runApp(Docapp(appRoutes: AppRoutes()));
}
