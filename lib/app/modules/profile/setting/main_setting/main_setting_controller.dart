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

  void goToPreferredOfBanks() {
    Get.toNamed("/preferred_of_banks");
  }

  void goToPreferredOfCurrencies() {
    Get.toNamed("/preferred_of_currencies");
  }
  //   void goToMainProfile() {
  //   Get.offNamed("/main_profile");
  // }

  ///storage.saveUser(user);
  // Get.to(Home());
}
