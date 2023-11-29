import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool rememberMe = false.obs;

  Future<void> login() async {
    try {
      Get.offAllNamed("/main_home");
    } catch (e) {}
  }

  void goToRegister() {
    Get.toNamed("/register");
  }

  void goToSendOtp() {
    Get.toNamed("/send_otp");
  }
}
