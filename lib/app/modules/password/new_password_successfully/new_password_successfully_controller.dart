import 'package:get/get.dart';

class NewPasswordSuccessfullyController extends GetxController {
  void goToLogin() {
    Get.offNamed("/login");
  }

  Future<void> goToHmoe() async {
    try {
      Get.offAllNamed("/mainHome");
    } catch (e) {
      print(e);
    }

    ///storage.saveUser(user);
    // Get.to(Home());
  }
}
