import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Add this import
import 'package:medinow/core/helper/constans.dart';
import 'package:medinow/core/helper/extentions.dart';
import 'package:medinow/core/helper/shared_pref_helper.dart';
import 'core/di/dibendancy_ingection.dart';
import 'core/routing/app_rout.dart';
import 'docApp.dart' show Docapp;
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(); // Fixed syntax (capital F, await, and proper method call)
  //checkIfLoggedInUser is initialize sharedprefranse
  checkIfLoggedInUser();
  // Initialize other dependencies
  setupGetIt();
  await ScreenUtil.ensureScreenSize();

  runApp(Docapp(appRoutes: AppRoutes()));
}

checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getString(
    SharedPrefKeys.userToken,
  );
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
