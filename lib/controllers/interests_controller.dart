import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vitpair/controllers/register_controller.dart';

class InterestsController extends GetxController {
  var isLoading = false.obs;

  Future<bool> addInterests(List<String> interests) async {
    isLoading(true);
    update();
    Map data = {"Area of Interests": interests};
    var url = Uri.parse("int");
    var response;
    try {
      response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );
      print(response.body);
      if (response.statusCode == 200) {
        RegisterController controller = Get.put(RegisterController());
        controller.user.areaOfInterests = interests;
        return true;
      } else {
        throw jsonDecode(response.body)['message'] ?? "Unknow Error Occured";
      }
    } catch (e) {
      // show error pop up
      showDialog(
          context: Get.context!,
          builder: (context) => AlertDialog(
                title: Text('Adding Interests Failed'),
                content: Text(e.toString()),
              ));

      return false;
    } finally {
      isLoading(false);
      update();
    }
  }
}
