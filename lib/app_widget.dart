import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'modules/home/home_screen.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PayFlow",
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      home: Home(),
    );
  }
}
