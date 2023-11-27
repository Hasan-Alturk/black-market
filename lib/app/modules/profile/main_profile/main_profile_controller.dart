import 'package:get/get.dart';

class MainProfileController extends GetxController {
  void goToEditProfile() {
    Get.offNamed("/edit_profile");
  }

  void goToMainProfile() {
    Get.offNamed("/main_profile");
  }

  void goToHome() {
    Get.offNamed("/main_home");
  }

  void goToMainCuurency() {
    Get.offNamed("/main_cuurency");
  }

  void goToMainSetting() {
    Get.offNamed("/main_setting");
  }

  ///storage.saveUser(user);
  // Get.to(Home());
}
