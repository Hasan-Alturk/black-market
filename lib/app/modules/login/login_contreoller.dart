import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool rememberMe = false.obs;

  Future<void> login() async {
    try {
      Get.offAllNamed("/home");
    } catch (e) {}
  }
}
