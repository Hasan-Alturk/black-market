import 'package:get/get.dart';

class NotificationsSettingController extends GetxController {
  RxBool isSwitchedCoins = false.obs;
  RxBool isSwitchedGold = false.obs;
  RxBool isSwitchedNews = false.obs;

  void toggleSwitch() {
    isSwitchedCoins.value = !isSwitchedCoins.value;
    isSwitchedGold.value = !isSwitchedGold.value;
    isSwitchedNews.value = !isSwitchedNews.value;
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
