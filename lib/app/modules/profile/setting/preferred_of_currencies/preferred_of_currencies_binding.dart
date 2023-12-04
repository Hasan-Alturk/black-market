import 'package:black_market/app/core/repo/setting_repo.dart';
import 'package:black_market/app/modules/profile/setting/preferred_of_banks/preferred_of_banks_controller.dart';
import 'package:get/get.dart';

class PreferredOfCurrenciesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PreferredOfBanksController(settingRepo: Get.find<SettingRepo>()));
  }
}
