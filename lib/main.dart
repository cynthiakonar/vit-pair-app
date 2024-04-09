import 'package:flutter/material.dart';
import 'package:vitpair/junior_home_screen.dart';
import 'package:vitpair/senior_home_screen.dart';

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
      home: const JuniorHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
