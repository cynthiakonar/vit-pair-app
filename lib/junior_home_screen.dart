import 'package:flutter/material.dart';
import 'package:vitpair/utils/colors.dart';

class JuniorHomeScreen extends StatefulWidget {
  const JuniorHomeScreen({super.key});

  @override
  State<JuniorHomeScreen> createState() => _JuniorHomeScreenState();
}

class _JuniorHomeScreenState extends State<JuniorHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Hey Cynthia 👋",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: Text('Junior Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
