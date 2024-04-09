import 'package:flutter/material.dart';

import 'package:vitpair/login_screen.dart';
import 'package:vitpair/screens/senior_home_screen.dart';
import 'package:vitpair/welcome_screen.dart';
// import 'package:vitpair/senior_home_screen.dart';
// import 'package:vitpair/screens/junior_home_screen.dart';
// import 'package:vitpair/screens/senior_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
