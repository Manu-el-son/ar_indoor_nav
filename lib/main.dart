// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ar_indoor_nav/splashscreen.dart';

void main() {
  runApp(const fooddash());
}

// ignore: camel_case_types
class fooddash extends StatelessWidget {
  const fooddash({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        home: SplashScreen());
  }
}
