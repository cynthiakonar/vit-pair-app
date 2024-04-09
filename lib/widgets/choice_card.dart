import 'package:flutter/material.dart';
import 'package:vitpair/senior_profile_screen.dart';
import 'package:url_launcher/url_launcher.dart';

Widget choiceCard(BuildContext context, Color colorStart, Color colorEnd,
    String title, String desc, String image) {
  return GestureDetector(
    onTap: () async {
      const url = "https://vtop.vit.ac.in/vtop/open/page";
      if (await canLaunch(url)) {
        await launch(url, forceWebView: true, enableJavaScript: true);
      } else {
        throw 'Could not launch $url';
      }
    },

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => SeniorProfileScreen(),
    //   ),

    child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              colorStart,
              colorEnd,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 125, width: 125),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              desc,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        )),
  );
}
