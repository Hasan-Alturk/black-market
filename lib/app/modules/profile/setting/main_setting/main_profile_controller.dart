import 'package:get/get.dart';

class MainSettingController extends GetxController {
  void goToMainProfile() {
    Get.offNamed("/main_profile");
  }

  void goToLanguage() {
    Get.offNamed("/language");
  }

  void goToChangePassword() {
    Get.offNamed("/change_password");
  }

  void goToNotificationsSetting() {
    Get.offNamed("/notifications_setting");
  }
  //   void goToMainProfile() {
  //   Get.offNamed("/main_profile");
  // }

  ///storage.saveUser(user);
  // Get.to(Home());
}
