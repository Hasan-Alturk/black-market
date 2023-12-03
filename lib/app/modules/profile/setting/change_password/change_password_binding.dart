import 'package:black_market/app/core/repo/setting_repo.dart';
import 'package:black_market/app/modules/profile/setting/change_password/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordBinding extends Bindings {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dependencies() {
    Get.put(ChangePasswordController(settingRepo: Get.find<SettingRepo>()));
  }
}
