import 'package:black_market/app/core/repo/auth_repo.dart';
import 'package:black_market/app/modules/password/send_otp/send_otp_controller.dart';
import 'package:get/get.dart';

class SendOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SendOtpController(authRepo: Get.find<AuthRepo>()));
  }
}
