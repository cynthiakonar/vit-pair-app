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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hey Cynthia 👋",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[900]),
            ),
            Text(
              "Welcome to VIT Pair",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey[900],
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
