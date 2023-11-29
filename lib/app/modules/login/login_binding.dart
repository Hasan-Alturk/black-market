import 'package:black_market/app/core/repo/auth_repo.dart';
import 'package:black_market/app/modules/login/login_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Dio(), permanent: true);
    Get.put(AuthRepo(Dio()), permanent: true);
    Get.put(LoginController(
      authRepo: Get.find<AuthRepo>(),
      // storageService: Get.find<StorageService>(),
    ));
  }
}
