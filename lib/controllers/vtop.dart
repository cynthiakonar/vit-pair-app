import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VtopController extends GetxController {
  var isLoading = false.obs;

  Future getVtop() async {
    isLoading(true);
    var url = Uri.parse("http://127.0.0.1:5000/registerC");
    var response;
    try {
      response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "username": "22BRS1283",
            "password": "Sahi@0208VIT",
            "captcha": "MYEJSP",
          }));
      if (response.statusCode == 200) {
        print(response.body);
        return true;
      } else {
        print(response.statusCode);
        // show error pop up
        return false;
      }
    } catch (e) {
      print("Something went wrong");
      // show error pop up
      print(response);
      return false;
    } finally {
      isLoading(false);
    }
  }
}
