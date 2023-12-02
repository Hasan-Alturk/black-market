import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  void checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    log("Executing checkToken");

    String? token = prefs.getString('token');
    bool? rememberMe = prefs.getBool("rememberMe");
    if (token != null && token.isNotEmpty && rememberMe == true) {
      Get.offAllNamed("/main_home");
    } else {
      Get.offAllNamed("/login");
    }
  }

  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        checkToken();
      },
    );

    super.onInit();
  }
}
