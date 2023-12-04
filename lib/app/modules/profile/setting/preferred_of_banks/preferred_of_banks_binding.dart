import 'package:black_market/app/core/repo/setting_repo.dart';
import 'package:black_market/app/modules/profile/setting/preferred_of_banks/preferred_of_banks_controller.dart';
import 'package:get/get.dart';

class PreferredOfBanksBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(AuthRepo(Get.find<Dio>()), permanent: true);
    Get.put(PreferredOfBanksController(settingRepo: Get.find<SettingRepo>()));
  }
}
