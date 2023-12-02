import 'dart:developer';

import 'package:black_market/app/core/repo/auth_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final AuthRepo authRepo;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String otp = Get.arguments[0];
  String email = Get.arguments[1];

  bool isLoading = false;

  ResetPasswordController({required this.authRepo});

  Future<void> goToNewPasswordSuccessfully() async {
    try {
      isLoading = true;
      update(["goToNewPasswordSuccessfully"]);
      await authRepo.passwordSuccessfully(
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
        otp: otp,
        email: email,
      );
      Get.toNamed(
        "/new_password_successfully",
        arguments: [email, passwordController.text],
      );
      isLoading = false;

      update(["goToNewPasswordSuccessfully"]);
    } on ExceptionHandler catch (e) {
      isLoading = false;
      log("Error: $e");
      update(["goToNewPasswordSuccessfully"]);
    }
  }
}
