import 'dart:developer';

import 'package:black_market/app/core/repo/auth_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class InsertOtpController extends GetxController {
  String email = Get.arguments;
  OtpTextField otpController = OtpTextField();

  final AuthRepo authRepo;

  InsertOtpController({required this.authRepo});

  Future<void> reSendOtp() async {
    try {
      update(["ReSendOtp"]);
      await authRepo.sendOtp(
        email: email,
      );

      update(["ReSendOtp"]);
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      update(["ReSendOtp"]);
    }
  }

  void goToResetPassword(String otp) {
    Get.toNamed(
      "/reset_password",
      arguments: [otp, email],
    );
  }
}
