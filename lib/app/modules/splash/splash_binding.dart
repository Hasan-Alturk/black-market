import 'package:black_market/app/core/repo/bank_repo.dart';
import 'package:black_market/app/core/repo/currency_repo.dart';
import 'package:black_market/app/core/repo/setting_repo.dart';
import 'package:black_market/app/modules/splash/splash_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Dio(), permanent: true);
    Get.put(BankRepo(Dio()), permanent: true);
    Get.put(CurrencyRepo(Dio()), permanent: true);
    Get.put(SettingRepo(Dio()),permanent: true);

    Get.put(
      SplashController(
        settingRepo: Get.find<SettingRepo>(),
        currencyRepo: Get.find<CurrencyRepo>(),
        bankRepo: Get.find<BankRepo>(),
      ),
    );
  }
}
