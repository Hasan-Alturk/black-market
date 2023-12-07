import 'package:black_market/app/core/repo/setting_repo.dart';
import 'package:black_market/app/modules/splash/splash_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Dio(), permanent: true);
    Get.put(
      SplashController(
        settingRepo: Get.put(
          SettingRepo(Get.find<Dio>()),
        ),
      ),
    );
  }
}
