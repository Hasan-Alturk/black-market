import 'dart:developer';

import 'package:black_market/app/core/repo/auth_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendOtpController extends GetxController {
  final AuthRepo authRepo;
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();

  SendOtpController({required this.authRepo});

  Future<void> goToInsertOtp() async {
    try {
      update(["ElevatedButton"]);
      isLoading = true;
      await authRepo.sendOtp(
        email: emailController.text,
      );

      Get.toNamed("/insert_otp");
      isLoading = false;
      update(["ElevatedButton"]);
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      isLoading = false;
      update(["ElevatedButton"]);
    }
  }
}
