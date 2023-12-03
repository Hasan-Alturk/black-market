import 'package:black_market/app/core/repo/setting_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isLoading = false;
  final SettingRepo settingRepo;

  ChangePasswordController({required this.settingRepo});

  // Future<void> goToNewPasswordSuccessfully() async {
  //   try {
  //     isLoading = true;
  //     update(["goToNewPasswordSuccessfully"]);
  //     await authRepo.passwordSuccessfully(
  //       password: passwordController.text,
  //       passwordConfirmation: confirmPasswordController.text,
  //       otp: otp,
  //       email: email,
  //     );
  //     Get.toNamed(
  //       "/new_password_successfully",
  //       arguments: [email, passwordController.text],
  //     );
  //     isLoading = false;

  //     update(["goToNewPasswordSuccessfully"]);
  //   } on ExceptionHandler catch (e) {
  //     isLoading = false;
  //     log("Error: $e");
  //     update(["goToNewPasswordSuccessfully"]);
  //   }
  // }

  void goToMainSetting() {
    Get.offNamed("/main_setting");
  }
}
