import 'package:flutter/material.dart';
import 'package:medinow/core/di/dibendancy_ingection.dart';
import 'package:medinow/core/routing/app_rout.dart';
import 'package:medinow/docApp.dart' show Docapp;
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  runApp(Docapp(appRoutes: AppRoutes()));
}
