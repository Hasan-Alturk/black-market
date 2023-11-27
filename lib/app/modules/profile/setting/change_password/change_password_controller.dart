import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  void goToMainProfile() {
    Get.offNamed("/main_profile");
  }

  void goToMainHome() {
    Get.offNamed("/main_home");
  }
  //   void goToMainProfile() {
  //   Get.offNamed("/main_profile");
  // }

  ///storage.saveUser(user);
  // Get.to(Home());
}
