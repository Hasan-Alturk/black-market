import 'package:black_market/app/modules/profile/setting/main_setting/main_profile_controller.dart';
import 'package:get/get.dart';

class MainSettingBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(AuthRepo(Get.find<Dio>()), permanent: true);
    Get.put(MainSettingController());
  }
}
