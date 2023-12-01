import 'package:black_market/app/core/repo/auth_repo.dart';
import 'package:black_market/app/modules/password/reset_password/reset_password_controller.dart';
import 'package:get/get.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ResetPasswordController(authRepo: Get.find<AuthRepo>()));
  }
}
