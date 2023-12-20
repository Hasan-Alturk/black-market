import 'package:black_market/app/core/repo/auth_repo.dart';
import 'package:black_market/app/core/repo/setting_repo.dart';
import 'package:black_market/app/modules/login/login_controller.dart';
import 'package:black_market/app/modules/main/main_home_binding.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthRepo(Dio()));
    Get.put(
      LoginController(
        authRepo: Get.find<AuthRepo>(),
        settingRepo: Get.find<SettingRepo>(),
      ),
    );
  }
}
