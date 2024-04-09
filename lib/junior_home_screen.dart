import 'package:flutter/material.dart';
import 'package:vitpair/utils/colors.dart';
import 'package:vitpair/widgets/choice_card.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hey Cynthia 👋",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[900]),
              ),
              Text(
                "Welcome to VIT Pair",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Instantly connect with a senior and receive your personalized guide to navigating college!",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.75,
                  ),
                  children: [
                    choiceCard(purpleGradientStart, purpleGradientEnd,
                        "Chat with Senior"),
                    choiceCard(orangeGradientStart, orangeGradientEnd,
                        "Senior Profile"),
                    choiceCard(greenGradientStart, greenGradientEnd,
                        "Pair New Senior"),
                    choiceCard(blueGradientStart, blueGradientEnd, "Settings")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
