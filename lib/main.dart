import 'package:doctor_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async{
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
      statusBarColor: Colors.white.withOpacity(0.6),
      statusBarIconBrightness: Brightness.dark,
    ));

  runApp(const App());
}
