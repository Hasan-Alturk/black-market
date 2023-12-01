import 'package:black_market/app/core/repo/auth_repo.dart';
import 'package:black_market/app/modules/password/new_password_successfully/new_password_successfully_controller.dart';
import 'package:get/get.dart';

class NewPasswordSuccessfullyBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(AuthRepo(Get.find<Dio>()), permanent: true);
    Get.put(NewPasswordSuccessfullyController(authRepo: Get.find<AuthRepo>()));
  }
}
