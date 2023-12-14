import 'package:black_market/app/core/repo/auth_repo.dart';
import 'package:black_market/app/core/repo/setting_repo.dart';
import 'package:black_market/app/modules/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController(
      authRepo: Get.find<AuthRepo>(),
      settingRepo: Get.find<SettingRepo>(),
    ));
  }
}
