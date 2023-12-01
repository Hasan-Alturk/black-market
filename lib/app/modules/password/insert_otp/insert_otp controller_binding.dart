import 'package:black_market/app/modules/password/insert_otp/insert_otp%20controller.dart';
import 'package:get/get.dart';

class InsertOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InsertOtpController());
  }
}
