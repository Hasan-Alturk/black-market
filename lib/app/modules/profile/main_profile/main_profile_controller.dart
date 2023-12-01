import 'dart:developer';

import 'package:black_market/app/core/repo/setting_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProfileController extends GetxController {
  bool isLoading = false;
  final SettingRepo settingRepo;

  MainProfileController({required this.settingRepo});

  Future<void> logOut() async {
    try {
      isLoading = true;
      update(["LogOut"]);
      log("logOut");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      await settingRepo.logOut(token: token.toString());
      await prefs.clear();
      Get.offAllNamed("/login");
      isLoading = false;

      update(["LogOut"]);
    } on ExceptionHandler catch (e) {
      isLoading = false;
      log("Error: $e");
      update(["LogOut"]);
    }
  }

  void goToEditProfile() {
    Get.toNamed("/edit_profile");
  }

  void goToMainCuurency() {
    Get.toNamed("/main_cuurency");
  }

  void goToMainSetting() {
    Get.toNamed("/main_setting");
  }
}
