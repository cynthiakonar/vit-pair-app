import 'package:flutter/material.dart';
import 'package:vitpair/screens/senior_profile_screen.dart';
import 'package:vitpair/screens/settings_screen.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
              const SizedBox(height: 12),
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
                    choiceCard(
                        context,
                        purpleGradientStart,
                        purpleGradientEnd,
                        "Chat with Senior",
                        "Last seen 22h ago",
                        "assets/connect.png",
                        const SeniorProfileScreen()),
                    choiceCard(
                        context,
                        orangeGradientStart,
                        orangeGradientEnd,
                        "Senior Profile",
                        "Sahil Agarwal",
                        "assets/girl.png",
                        const SeniorProfileScreen()),
                    choiceCard(
                        context,
                        greenGradientStart,
                        greenGradientEnd,
                        "Pair New Senior",
                        "128 Seniors",
                        "assets/boy.png",
                        const SeniorProfileScreen()),
                    choiceCard(
                        context,
                        blueGradientStart,
                        blueGradientEnd,
                        "Settings",
                        "Customize",
                        "assets/senior.png",
                        const SettingsPage())
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
