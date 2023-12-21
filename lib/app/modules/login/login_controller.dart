import 'dart:developer';

import 'package:black_market/app/core/model/user.dart';
import 'package:black_market/app/core/model/user_setting.dart';
import 'package:black_market/app/core/plugin/shared_storage.dart';
import 'package:black_market/app/core/repo/auth_repo.dart';
import 'package:black_market/app/core/repo/setting_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthRepo authRepo;
  final SettingRepo settingRepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  String? error;
  RxBool rememberMe = false.obs;

  LoginController({
    required this.authRepo,
    required this.settingRepo,
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
      SharedStorage.saveTokenAndRememberMe(
        mainUser.accessToken,
        rememberMe.value,
      );
      await getUserSetting();

      Get.toNamed("/main_home");

      isLoading = false;
      update(["TextError", "ElevatedButton"]);
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      isLoading = false;
      error = e.error;
      log(error!);

      update(["TextError", "ElevatedButton"]);
    }
  }

  Future<UserSetting> getUserSetting() async {
    try {
      String? token = await SharedStorage.getToken();

      UserSetting userSetting = await settingRepo.getUserSetting(
        token: token.toString(),
      );

      await SharedStorage.saveUserSetting(userSetting);
      return userSetting;
    } on ExceptionHandler catch (e) {
      log("Error: $e");

      throw ExceptionHandler("Unknown error");
    }
  }

  void goToRegister() {
    Get.toNamed("/register");
  }

  void goToSendOtp() {
    Get.toNamed("/send_otp");
  }
}
