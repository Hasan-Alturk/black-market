import 'package:get/get.dart';

class SendOtpController extends GetxController {
  void goToLogin() {
    Get.offNamed("/login");
  }

  void goToInsertOtp() {
    Get.offNamed("/insert_otp");
  }
}
