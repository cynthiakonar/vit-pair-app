import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vitpair/screens/form_screen.dart';

import 'package:vitpair/sign_up_screen.dart';
import 'package:vitpair/screens/junior_home_screen.dart';
import 'package:vitpair/screens/senior_home_screen.dart';
import 'package:vitpair/splash_screen.dart';

import 'controllers/setup_controller.dart';
// import 'package:vitpair/senior_home_screen.dart';
// import 'package:vitpair/screens/junior_home_screen.dart';
// import 'package:vitpair/screens/senior_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final startup = Get.put(SetupController());
  await startup.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
