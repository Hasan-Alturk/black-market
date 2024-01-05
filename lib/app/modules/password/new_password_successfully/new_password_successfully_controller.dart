import 'dart:developer';

import 'package:black_market/app/core/model/user.dart';
import 'package:black_market/app/core/model/user_setting.dart';
import 'package:black_market/app/core/plugin/shared_storage.dart';
import 'package:black_market/app/core/repo/auth_repo.dart';
import 'package:black_market/app/core/repo/setting_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:black_market/app/modules/main/main_home_controller.dart';
import 'package:get/get.dart';

class NewPasswordSuccessfullyController extends GetxController {
  String email = Get.arguments[0];
  String password = Get.arguments[1];
  final AuthRepo authRepo;
  final SettingRepo settingRepo;

  bool isLoading = false;

  NewPasswordSuccessfullyController({
    required this.authRepo,
    required this.settingRepo,
  });

  Future<void> login() async {
    try {
      isLoading = true;
      update(["login"]);
      MainUser mainUser = await authRepo.login(
        email: email,
        password: password,
      );
      SharedStorage.saveTokenAndRememberMe(
        mainUser.accessToken,
        true,
      );
      await getUserSetting();

      Get.offAllNamed("/main_home");
      Get.find<MainHomeController>().onInit();

      isLoading = false;
      update(["login"]);
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      isLoading = false;
      update(["login"]);
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
}
