import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController passwordController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();

  bool isLoading = false;

  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> login() async {
    isLoading = true;
    update();
    Map data = {
      "username": usernameController.text.trim(),
      "password": passwordController.text.trim(),
    };
    var url = Uri.parse("login");
    var response;
    try {
      response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );
      print(response.body);
      if (response.statusCode == 201) {
        // final SharedPreferences? prefs = await _prefs;
        // await prefs?.setString(
        //     "token", jsonDecode(response.body)['accessToken']);
        // await prefs?.setBool("isLoggedIn", true);

        // emailController.clear();
        // passwordController.clear();
        return true;
      } else {
        throw jsonDecode(response.body)['message'] ?? "Unknow Error Occured";
      }
    } catch (e) {
      // show error pop up
      showDialog(
          context: Get.context!,
          builder: (context) => AlertDialog(
                title: Text('Login Failed'),
                content: Text(e.toString()),
              ));

      return false;
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<bool> logout() async {
    // final _sharedPref = await SharedPreferences.getInstance();
    try {
      // _sharedPref.remove('token');
      // _sharedPref.remove('isLoggedIn');
      return true;
    } catch (e) {
      // show error pop up
      showDialog(
          context: Get.context!,
          builder: (context) => AlertDialog(
                title: Text('Logout Failed'),
                content: Text(e.toString()),
              ));
      return false;
    }
  }
}
