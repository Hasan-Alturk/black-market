import 'package:get/get.dart';

class NotificationsSettingController extends GetxController {
  RxBool isSwitched = false.obs;
  void toggleSwitch() {
    isSwitched.value = !isSwitched.value;
  }

  void goToMainSetting() {
    Get.offNamed("/main_setting");
  }

  //   void goToMainProfile() {
  //   Get.offNamed("/main_profile");
  // }

  ///storage.saveUser(user);
  // Get.to(Home());
}
