import 'dart:developer';

import 'package:black_market/app/core/model/user.dart';
import 'package:black_market/app/core/model/user_setting.dart';
import 'package:black_market/app/core/plugin/shared_storage.dart';
import 'package:black_market/app/core/repo/auth_repo.dart';
import 'package:black_market/app/core/repo/setting_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  final AuthRepo authRepo;
  final SettingRepo settingRepo;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  bool isLoading = false;
  String? error;

  RegisterController({
    required this.authRepo,
    required this.settingRepo,
  });

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
      await getUserSetting();

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
}
