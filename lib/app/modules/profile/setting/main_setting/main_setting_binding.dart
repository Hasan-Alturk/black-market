import 'package:black_market/app/modules/profile/setting/main_setting/main_setting_controller.dart';
import 'package:get/get.dart';

class MainSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainSettingController());
  }
}
