import 'dart:developer';

import 'package:black_market/app/core/model/setting.dart';
import 'package:black_market/app/core/plugin/shared_storage.dart';
import 'package:black_market/app/core/repo/setting_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final SettingRepo settingRepo;
  bool isLoading = false;

  SplashController({required this.settingRepo});

  @override
  void onInit() {
    onStartSplash();
    super.onInit();
  }

  Future<void> onStartSplash() async {
    try {
      isLoading = true;
      update();

      log("onStartSplash");
      await Future.delayed(
          const Duration(seconds: 1)); // قم بتعديل المدة حسب الحاجة

      checkToken();
      await getSetting();
      await Future.delayed(
          const Duration(seconds: 1)); // قم بتعديل المدة حسب الحاجة

      isLoading = false;
      update();
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      throw ExceptionHandler("Unknown error");
    }
  }

  void checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    bool? rememberMe = prefs.getBool("rememberMe");
    if (token != null && token.isNotEmpty && rememberMe == true) {
      Get.offAllNamed("/main_home");
    } else {
      Get.offAllNamed("/login");
    }
  }

  // Future<UserSetting> getUserSetting() async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     String? token = prefs.getString('token');

  //     UserSetting userSetting = await settingRepo.getUserSetting(
  //       token: token.toString(),
  //     );

  //     await Shared.saveUserSetting(userSetting);
  //     return userSetting;
  //   } on ExceptionHandler catch (e) {
  //     log("Error: $e");

  //     throw ExceptionHandler("Unknown error");
  //   }
  // }

  Future<void> getSetting() async {
    try {
      log("getSetting");
      Setting setting = await settingRepo.getSetting();
      await SharedStorage.saveSetting(setting);
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      throw ExceptionHandler("Unknown error");
    }
  }
}
