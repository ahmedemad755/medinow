import 'package:flutter/material.dart';
import 'package:medinow/core/di/dibendancy_ingection.dart';
import 'package:medinow/core/routing/app_rout.dart';
import 'package:medinow/docApp.dart' show Docapp;

void main() {
  setupGetIt();
  runApp(Docapp(appRoutes: AppRoutes()));
}
