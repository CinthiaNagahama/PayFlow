import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_screen.dart';
import 'package:payflow/modules/home/home_screen.dart';
import 'package:payflow/modules/insert_slip/insert_slip_screen.dart';
import 'package:payflow/modules/splash/splash_screen.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'modules/login/login_screen.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PayFlow",
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.primary,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashScreen(),
        "/home": (context) => HomeScreen(user: ModalRoute.of(context)!.settings.arguments as UserModel),
        "/login": (context) => LoginScreen(),
        "/barcode_scanner": (context) => BarcodeScannerScreen(),
        "/insert_slip": (context) => InsertSlipScreen(
              barcode: ModalRoute.of(context) != null ? ModalRoute.of(context)!.settings.arguments.toString() : "",
            ),
      },
    );
  }
}
