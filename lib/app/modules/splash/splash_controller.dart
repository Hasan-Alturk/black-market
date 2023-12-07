import 'dart:developer';

import 'package:black_market/app/core/model/setting.dart';
import 'package:black_market/app/core/repo/setting_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:black_market/app/modules/splash/shared.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final SettingRepo settingRepo;

  SplashController({required this.settingRepo});

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

  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        checkToken();
        getSetting();
        // getUserSetting();
      },
    );

    super.onInit();
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

  Future<Setting> getSetting() async {
    try {
      log("settingMainProfile");

      Setting setting = await settingRepo.getSetting();
      await Shared.saveSetting(setting);
      log(setting.abouttext);
      return setting;
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      throw ExceptionHandler("Unknown error");
    }
  }
}
