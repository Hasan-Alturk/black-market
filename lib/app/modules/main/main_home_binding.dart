import 'package:black_market/app/core/repo/setting_repo.dart';
import 'package:black_market/app/modules/currencies/currencies_binding.dart';
import 'package:black_market/app/modules/main/main_home_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class MainHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingRepo(Dio()));
    Get.put(MainHomeController(settingRepo: Get.find<SettingRepo>()));
    CurrenciesBinding().dependencies();
  }
}
