import 'package:get/get.dart';

class InsertOtpController extends GetxController {
  void goToLogin() {
    Get.offNamed("/login");
  }

  void goToResetPassword() {
    Get.offNamed("/reset_password");
  }
}
