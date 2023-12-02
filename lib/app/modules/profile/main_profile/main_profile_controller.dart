import 'dart:developer';

import 'package:black_market/app/core/model/user_setting.dart';
import 'package:black_market/app/core/repo/setting_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProfileController extends GetxController {
  bool isLoading = false;
  final SettingRepo settingRepo;
  RxString name = "".obs;
  RxString avatar = "".obs;

  MainProfileController({
    required this.settingRepo,
  });

  @override
  void onInit() {
    super.onInit();
    getUserSetting();
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

  Future<void> getUserSetting() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      UserSetting userSetting = await settingRepo.getUserSetting(
        token: token.toString(),
      );
      name.value = userSetting.name;
      avatar.value = userSetting.avatar;
    } on ExceptionHandler catch (e) {
      log("Error: $e");
    }
  }

  void goToMainCuurency() {
    Get.toNamed("/main_cuurency");
  }

  void goToMainSetting() {
    Get.toNamed("/main_setting");
  }

  Future<void> saveNameAndAvatar(String name, String avatar) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
    prefs.setString('avatar', avatar);
  }
}
