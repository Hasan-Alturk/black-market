import 'package:black_market/app/core/model/user.dart';
import 'package:black_market/app/core/repo/auth_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  final AuthRepo authRepo;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  bool isLoading = false;
  String? error;

  RegisterController({required this.authRepo});

  Future<void> register() async {
    try {
      error = null;
      isLoading = true;
      update(["TextError", "ElevatedButton"]);
      MainUser mainUser = await authRepo.register(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
      );
      await saveTokenAndRememberMe(mainUser.accessToken, true);

      Get.offAllNamed("/main_home");
      isLoading = false;
      update(["TextError", "ElevatedButton"]);
    } on ExceptionHandler catch (e) {
      isLoading = false;
      error = e.error;

      update(["TextError", "ElevatedButton"]);
    }
  }

  Future<void> saveTokenAndRememberMe(String token, bool rememberMe) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    prefs.setBool('rememberMe', rememberMe);
  }
}
