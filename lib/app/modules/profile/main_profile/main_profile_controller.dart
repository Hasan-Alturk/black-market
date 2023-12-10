import 'dart:developer';

import 'package:black_market/app/core/model/setting.dart';
import 'package:black_market/app/core/model/user_setting.dart';
import 'package:black_market/app/core/repo/setting_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:black_market/app/core/plugin/shared_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProfileController extends GetxController {
  final SettingRepo settingRepo;
  String name = "";
  String avatar = "";
  bool isLoading = false;

  MainProfileController({
    required this.settingRepo,
  });

  @override
  void onInit() {
    //   getSetting();
    super.onInit();
  }

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

  void goToMainCuurency() {
    Get.toNamed("/main_cuurency");
  }

  void goToMainSetting() {
    Get.toNamed("/main_setting");
  }

  void goToAboutApp() {
    Get.toNamed("/about_app");
  }
}
