import 'package:black_market/app/core/repo/auth_repo.dart';
import 'package:black_market/app/modules/password/insert_otp/insert_otp_controller.dart';
import 'package:get/get.dart';

class InsertOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InsertOtpController(authRepo: Get.find<AuthRepo>()));
  }
}
