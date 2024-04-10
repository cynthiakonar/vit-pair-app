import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vitpair/utils/urls.dart';

class RegisterController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController captchaController = TextEditingController();

  bool isLoading = false;

  bool capFlag = false;

  Future<bool> getCaptcha() async {
    isLoading = true;
    update();
    var url = Uri.parse(URL.captcha);
    var response;
    try {
      response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
        capFlag = true;
        update();
        return true;
      } else {
        print(response);
        throw jsonDecode(response.body)['message'] ?? "Unknow Error Occured";
      }
    } catch (e) {
      print(e.toString());
      print(response.statusCode);
      print(response.body);
      // show error SnackBar

      Get.snackbar(
        'Captcha Failed',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<bool> signup(BuildContext context) async {
    isLoading = true;
    update();

    var url = Uri.parse("reg");
    Map body = {
      "username": usernameController.text,
      "password": passwordController.text,
      "captcha": captchaController.text.toUpperCase(),
    };
    print(body);
    var response;
    try {
      response = await http.post(
        url,
        body: jsonEncode(body),
        headers: {
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        print(response.body);

        return true;
      } else {
        print(response);
        throw jsonDecode(response.body)['message'] ?? "Unknow Error Occured";
      }
    } catch (e) {
      print(e.toString());
      print(response.statusCode);
      print(response.body);
      // show error SnackBar

      Get.snackbar(
        'Registration Failed',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } finally {
      isLoading = false;
      update();
    }
  }
}
