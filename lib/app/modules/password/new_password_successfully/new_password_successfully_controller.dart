import 'dart:developer';

import 'package:black_market/app/core/model/user.dart';
import 'package:black_market/app/core/repo/auth_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewPasswordSuccessfullyController extends GetxController {
  String email = Get.arguments[0];
  String password = Get.arguments[1];
  final AuthRepo authRepo;
  bool isLoading = false;

  NewPasswordSuccessfullyController({required this.authRepo});

  Future<void> login() async {
    try {
      isLoading = true;
      update(["login"]);
      MainUser mainUser = await authRepo.login(
        email: email,
        password: password,
      );
      await saveTokenAndRememberMe(mainUser.accessToken, true);

      log(mainUser.user.email.toString());

      Get.offAllNamed("/main_home");
      isLoading = false;
      update(["login"]);
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      isLoading = false;
      update(["login"]);
    }
  }

  Future<void> saveTokenAndRememberMe(String token, bool rememberMe) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    prefs.setBool('rememberMe', rememberMe);
  }
}
