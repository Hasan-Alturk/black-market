import 'package:get/get.dart';

class MainProfileController extends GetxController {
  void goToEditProfile() {
    Get.toNamed("/edit_profile");
  }

  void goToMainCuurency() {
    Get.toNamed("/main_cuurency");
  }

  void goToMainSetting() {
    Get.toNamed("/main_setting");
  }

  ///storage.saveUser(user);
  // Get.to(Home());
}
