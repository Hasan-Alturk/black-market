import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  

  void goToNewPasswordSuccessfully() {
    Get.toNamed("/new_password_successfully");
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
