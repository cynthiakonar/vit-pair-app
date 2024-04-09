import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vitpair/services/vtop.dart';
import 'package:vitpair/utils/colors.dart';

class SeniorProfileScreen extends StatefulWidget {
  const SeniorProfileScreen({super.key});

  @override
  State<SeniorProfileScreen> createState() => _SeniorProfileScreenState();
}

class _SeniorProfileScreenState extends State<SeniorProfileScreen> {
  VtopController controller = Get.put(VtopController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getVtop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
            color: Colors.black,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xfff8f4fc),
                        ),
                      ),
                      Image.asset(
                        'assets/thinking.png',
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Cynthia",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey[900],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Computer Science",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "VIT Vellore",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ));
  }
}
