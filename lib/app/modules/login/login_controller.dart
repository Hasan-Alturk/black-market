import 'dart:developer';

import 'package:black_market/app/core/model/user.dart';
import 'package:black_market/app/core/repo/auth_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthRepo authRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  String? error;
  RxBool rememberMe = false.obs;

  LoginController({
    required this.authRepo,
  });

  Future<void> login() async {
    try {
      error = null;
      isLoading = true;
      update(["TextError", "ElevatedButton"]);
      MainUser mainUser = await authRepo.login(
        email: emailController.text,
        password: passwordController.text,
      );
      log(mainUser.accessToken.toString());

      Get.offAllNamed("/main_home");
      isLoading = false;
      update(["ElevatedButton"]);
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      isLoading = false;
      error = e.error;
      log(error!);

      update(["TextError", "ElevatedButton"]);
    }
  }

  void goToRegister() {
    Get.toNamed("/register");
  }

  void goToHome() {
    Get.offAllNamed("/main_home");
  }

  void goToSendOtp() {
    Get.toNamed("/send_otp");
  }
}
