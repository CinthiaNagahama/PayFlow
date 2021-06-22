import 'package:flutter/material.dart';
// import 'package:payflow/modules/login/login_screen.dart';
// import 'package:payflow/modules/splash/splash_screen.dart';
import 'modules/home/home_screen.dart';
import 'package:payflow/shared/themes/app_colors.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "PayFlow",
        theme: ThemeData(
          primaryColor: AppColors.primary,
        ),
        home: Home());
  }
}
