import 'package:get/get.dart';

// import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitpair/sign_up_screen.dart';
import 'package:vitpair/screens/junior_home_screen.dart';

class SetupController extends GetxController {
  RxBool isLoggedIn = true.obs;
  RxString token = "".obs;
  // late SharedPreferences _prefs;
  var route;

  @override
  void onInit() {
    setup();
    super.onInit();
  }

  setup() async {
    // await SharedPreferences.getInstance().then((value) {
    //   _prefs = value;
    //   isLoggedIn.value = _prefs.getBool('isLoggedIn') ?? false;
    //   token.value = _prefs.getString('token') ?? "";
    // });

    route = isLoggedIn.value ? JuniorHomeScreen() : SignupScreen();
  }
}
