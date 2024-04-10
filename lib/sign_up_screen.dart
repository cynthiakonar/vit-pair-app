import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vitpair/controllers/register_controller.dart';
import 'package:vitpair/login_screen.dart';
import 'package:vitpair/screens/junior_home_screen.dart';
import 'package:vitpair/utils/colors.dart';
import 'package:vitpair/utils/urls.dart';
// import '../../../constants.dart';
import '../../widgets/text_input_field.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  RegisterController registerController = Get.put(RegisterController());

  @override
  void initState() {
    super.initState();
    registerController.getCaptcha();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Container(
        alignment: Alignment.center,
        child: Column(
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
            const Text(
              'Register with VTOP credentials',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: registerController.usernameController,
                labelText: 'VTOP Username',
                icon: Icons.email,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: registerController.passwordController,
                labelText: 'Password',
                icon: Icons.lock,
                isObscure: true,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(
              () => !registerController.isLoading.value
                  ? registerController.capFlag.value
                      ? const Image(image: NetworkImage(URL.captcha))
                      : const SizedBox()
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(
              () => !registerController.isLoading.value
                  ? registerController.capFlag.value
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextInputField(
                            controller: registerController.captchaController,
                            labelText: 'Enter CAPTCHA',
                            icon: Icons.autorenew_outlined,
                          ),
                        )
                      : const SizedBox()
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            const SizedBox(
              height: 30,
            ),
            GetBuilder<RegisterController>(builder: (controller) {
              return Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                decoration: BoxDecoration(
                  color: backgroundpurple,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: InkWell(
                  onTap: () async {
                    final result = await registerController.signup(context);
                    if (result) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const JuniorHomeScreen(),
                        ),
                      );
                    }
                  },
                  child: const Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account? ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20, color: darkerpurple),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
