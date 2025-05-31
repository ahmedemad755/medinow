import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Add this import
import 'package:medinow/core/di/dibendancy_ingection.dart';
import 'package:medinow/core/routing/app_rout.dart';
import 'package:medinow/docApp.dart' show Docapp;
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(); // Fixed syntax (capital F, await, and proper method call)

  // Initialize other dependencies
  setupGetIt();
  await ScreenUtil.ensureScreenSize();

  runApp(Docapp(appRoutes: AppRoutes()));
}
