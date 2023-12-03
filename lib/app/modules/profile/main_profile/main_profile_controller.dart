import 'dart:developer';

import 'package:black_market/app/core/model/user_setting.dart';
import 'package:black_market/app/core/repo/setting_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProfileController extends GetxController {
  bool isLoading = false;
  final SettingRepo settingRepo;
  String name = "";
  String avatar = "";

  MainProfileController({
    required this.settingRepo,
  });

  @override
  void onInit() {
    getUserSetting();
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

  Future<UserSetting> getUserSetting() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      UserSetting userSetting = await settingRepo.getUserSetting(
        token: token.toString(),
      );
      name = userSetting.name;
      update();

      return UserSetting(
        id: userSetting.id,
        roleId: userSetting.roleId,
        name: userSetting.name,
        email: userSetting.email,
        avatar: userSetting.avatar,
        settings: userSetting.settings,
        createdAt: userSetting.createdAt,
        updatedAt: userSetting.updatedAt,
        savings: userSetting.savings,
        favorites: userSetting.favorites,
      );
    } on ExceptionHandler catch (e) {
      log("Error: $e");

      throw ExceptionHandler("Unknown error");
    }
  }

  void goToMainCuurency() {
    Get.toNamed("/main_cuurency");
  }

  void goToMainSetting() {
    Get.toNamed("/main_setting");
  }
}
