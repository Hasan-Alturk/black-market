import 'package:black_market/app/modules/password/send_otp/send_otp_controller.dart';
import 'package:get/get.dart';

class SendOtpBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(AuthRepo(Get.find<Dio>()), permanent: true);
    Get.put(SendOtpController());
  }
}
