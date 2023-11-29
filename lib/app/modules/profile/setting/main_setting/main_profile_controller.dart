import 'package:get/get.dart';

class MainSettingController extends GetxController {

  void goToLanguage() {
    Get.toNamed("/language");
  }

  void goToChangePassword() {
    Get.toNamed("/change_password");
  }

  void goToNotificationsSetting() {
    Get.toNamed("/notifications_setting");
  }
  //   void goToMainProfile() {
  //   Get.offNamed("/main_profile");
  // }

  ///storage.saveUser(user);
  // Get.to(Home());
}
