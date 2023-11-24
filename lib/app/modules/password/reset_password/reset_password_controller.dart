import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  void goToLogin() {
    Get.offNamed("/login");
  }

  void goToNewPasswordSuccessfully() {
    Get.offNamed("/new_password_successfully");
  }

  Future<void> goToHmoe() async {
    try {
      Get.offAllNamed("/home");
    } catch (e) {
      print(e);
    }

    ///storage.saveUser(user);
    // Get.to(Home());
  }
}
