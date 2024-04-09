import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vitpair/login_screen.dart';
import 'package:vitpair/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'VIT Pair',
                style: TextStyle(
                  fontSize: 35,
                  color: darkerpurple,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: height * 0.2),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
