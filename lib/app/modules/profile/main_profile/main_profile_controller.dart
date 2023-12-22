import 'dart:developer';

import 'package:black_market/app/core/model/user_setting.dart';
import 'package:black_market/app/core/plugin/shared_storage.dart';
import 'package:black_market/app/core/repo/setting_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:black_market/app/modules/main/main_home_controller.dart';
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
  void onInit() async {
    update(["name_and_avatar"]);
    await getNameAndAvatar();
    super.onInit();
  }

  Future<void> getNameAndAvatar() async {
    UserSetting? storedUserSetting =
        await SharedStorage.getUserSettingFromPrefs();
    if (storedUserSetting != null) {
      name = storedUserSetting.name;
      avatar = storedUserSetting.avatar;
    } else {
      return;
    }
    update(["name_and_avatar"]);
  }

  Future<void> logOut() async {
    try {
      isLoading = true;
      update(["LogOut"]);
      String? token = await SharedStorage.getToken();
      log(token.toString());
      await settingRepo.logOut(token: token.toString());

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      await prefs.remove('user_setting');
      Get.offAllNamed("/main_home");
      Get.find<MainHomeController>().onInit();
      isLoading = false;

      update(["LogOut"]);
    } on ExceptionHandler catch (e) {
      isLoading = false;
      log("Error: $e");
      update(["LogOut"]);
    }
  }

  void goToLogin() {
    Get.toNamed("/login");
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
